#!/usr/bin/env bash

set -euo pipefail # Exit on error, unset vars, or pipe failures

init() {
	TEMPLATE_DIR="templates"
	HOST_DIR="hosts"
	# Colors (fallback if tput fails)
	if command -v tput >/dev/null; then
		NORMAL=$(tput sgr0)
		WHITE=$(tput setaf 7)
		BLACK=$(tput setaf 0)
		RED=$(tput setaf 1)
		GREEN=$(tput setaf 2)
		YELLOW=$(tput setaf 3)
		BLUE=$(tput setaf 4)
		MAGENTA=$(tput setaf 5)
		CYAN=$(tput setaf 6)
		BRIGHT=$(tput bold)
		UNDERLINE=$(tput smul)
	else
		NORMAL=""
		WHITE=""
		BLACK=""
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		MAGENTA=""
		CYAN=""
		BRIGHT=""
		UNDERLINE=""
	fi
}

confirm() {
	echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]:"
	read -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 0
	fi
}

print_header() {
	echo -E "
                    $CYAN Rikand Nix installation
                  $BLUE https://github.com/Rikand98 $RED
      ! To make sure everything runs correctly DONT run as root ! $GREEN
                        -> '"./install.sh"' $NORMAL

    "
}

set_username() {
	while true; do
		echo -en "Enter your${GREEN} username${NORMAL}: $YELLOW"
		read username
		[[ -n "$username" ]] || {
			echo "${RED}Username cannot be empty.${NORMAL}"
			continue
		}
		echo -e "${NORMAL}Use${YELLOW} $username${NORMAL} as ${GREEN}username${NORMAL}? "
		confirm
		break
	done
	echo "Username set to $username."
}

set_system() {
	while true; do
		echo -en "Choose the ${GREEN}system type${NORMAL} - [${YELLOW}N${NORMAL}]ixOS, [${YELLOW}D${NORMAL}]arwin: "
		read -n 1 -r
		echo
		if [[ $REPLY =~ ^[Nn]$ ]]; then
			SYSTEM="nixos"
			break
		elif [[ $REPLY =~ ^[Dd]$ ]]; then
			SYSTEM="darwin"
			break
		else
			echo "${RED}Invalid choice. Please select 'N' for NixOS or 'D' for Darwin.${NORMAL}"
		fi
	done
	echo "System set to $SYSTEM."
}

set_host() {
	while true; do
		echo -en "Choose the ${GREEN}host${NORMAL} - [${YELLOW}D${NORMAL}]esktop, [${YELLOW}L${NORMAL}]aptop, [${YELLOW}V${NORMAL}]M: "
		read -n 1 -r
		echo
		if [[ $REPLY =~ ^[Dd]$ ]]; then
			HOST="desktop"
			break
		elif [[ $REPLY =~ ^[Ll]$ ]]; then
			HOST="laptop"
			break
		elif [[ $REPLY =~ ^[Vv]$ ]]; then
			HOST="vm"
			break
		else
			echo "${RED}Invalid choice. Please select 'D', 'L', or 'V'.${NORMAL}"
		fi
	done
	echo "Host set to $HOST."
}

set_hostname() {
	while true; do
		echo -en "Enter your ${GREEN}hostname${NORMAL}: $YELLOW"
		read hostname
		[[ -n "$hostname" ]] || {
			echo "${RED}Hostname cannot be empty.${NORMAL}"
			continue
		}
		echo -e "${NORMAL}Use${YELLOW} $hostname${NORMAL} as ${GREEN}hostname${NORMAL}? "
		confirm
		break
	done
}

generate_host_template() {
	local TARGET_DIR="$HOST_DIR/$hostname"
	local TEMPLATE_FILE="$HOST_DIR/$TEMPLATE_DIR/$SYSTEM.$HOST.nix"

	if [[ -d "$TARGET_DIR" ]]; then
		echo "${YELLOW}Host directory $TARGET_DIR already exists. Overwrite?${NORMAL} "
		confirm
	fi

	echo "Generating host template..."
	mkdir -p "$TARGET_DIR" || {
		echo "${RED}Failed to create $TARGET_DIR.${NORMAL}"
		exit 1
	}
	cp "$TEMPLATE_FILE" "$TARGET_DIR/default.nix" || {
		echo "${RED}Failed to copy template.${NORMAL}"
		exit 1
	}
	echo "Host template generated at $TARGET_DIR/default.nix."
}

set_github() {
	while true; do
		echo -en "Enter your ${GREEN}github username${NORMAL}: $YELLOW"
		read github_username
		[[ -n "$github_username" ]] || {
			echo "${RED}GitHub username cannot be empty.${NORMAL}"
			continue
		}
		echo -e "${NORMAL}Is${YELLOW} $github_username${NORMAL} your ${GREEN}github username${NORMAL}? "
		confirm
		break
	done

	while true; do
		echo -en "Enter your ${GREEN}github repo name${NORMAL}: $YELLOW"
		read github_reponame
		[[ -n "$github_reponame" ]] || {
			echo "${RED}Repo name cannot be empty.${NORMAL}"
			continue
		}
		echo -e "${NORMAL}Is${YELLOW} $github_reponame${NORMAL} your ${GREEN}github repo name${NORMAL}? "
		confirm
		break
	done

	while true; do
		echo -en "Enter your ${GREEN}github email${NORMAL}: $YELLOW"
		read github_email
		[[ -n "$github_email" ]] || {
			echo "${RED}Email cannot be empty.${NORMAL}"
			continue
		}
		echo -e "${NORMAL}Is${YELLOW} $github_email${NORMAL} your ${GREEN}github email${NORMAL}? "
		confirm
		break
	done

	git remote set-url origin git@github.com:$github_username/$github_reponame || {
		echo "${RED}Failed to set git remote.${NORMAL}"
		exit 1
	}
}

set_ssh() {
	echo -en "Do you need a new ${GREEN}SSH${NORMAL}key?[${GREEN}y${NORMAL}/${RED}n${NORMAL}]:"
	read -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		if [[ -f ~/.ssh/id_ed25519 ]]; then
			echo "${YELLOW}Existing SSH key found at ~/.ssh/id_ed25519. Overwrite?${NORMAL} "
			confirm
		fi
		ssh-keygen -t ed25519 -C "$github_email" || {
			echo "${RED}Failed to generate SSH key.${NORMAL}"
			exit 1
		}
		ssh-add ~/.ssh/id_ed25519 || {
			echo "${RED}Failed to add SSH key.${NORMAL}"
			exit 1
		}
		echo "Public key: $(cat ~/.ssh/id_ed25519.pub)"
		echo "${YELLOW}Add this key to GitHub: https://github.com/settings/keys${NORMAL}"
		echo -en "Have you added your new ${GREEN}SSH${NORMAL}key?[${GREEN}y${NORMAL}/${RED}n${NORMAL}]:"
		read -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 0
		fi
	fi

	git config --global user.name "$github_username"
	git config --global user.email "$github_email"
}

create_user_info() {
	if [[ -f user_info.nix ]]; then
		echo "${YELLOW}user_info.nix already exists. Overwrite?${NORMAL} "
		confirm

	fi

	echo "Creating user_info.nix..."
	cat <<EOF >user_info.nix
# Private configuration - not committed to git
{
  username = "$username";
  hostname = "$hostname";
  gitUserName = "$github_username";
  gitEmail = "$github_email";
}
EOF
	echo "user_info.nix created."

	# Ensure user_info.nix is ignored by git
	if [ ! -f .gitignore ]; then
		echo "user_info.nix" >.gitignore
	else
		grep -q "user_info.nix" .gitignore || echo "user_info.nix" >>.gitignore
	fi
}

install() {
	echo -e "\n${RED}START INSTALL PHASE${NORMAL}\n"
	sleep 0.2

	if [[ "$SYSTEM" == "nixos" ]]; then
		# Create basic directories
		echo -e "Creating folders:"
		echo -e "    - ${MAGENTA}~/Music${NORMAL}"
		echo -e "    - ${MAGENTA}~/Videos${NORMAL}"
		echo -e "    - ${MAGENTA}~/Documents${NORMAL}"
		echo -e "    - ${MAGENTA}~/Pictures/wallpapers${NORMAL}"
		mkdir -p ~/Music ~/Videos ~/Documents ~/Pictures/wallpapers || {
			echo "${RED}Failed to create directories.${NORMAL}"
			exit 1
		}
		sleep 0.2

		# Copy the wallpapers
		echo -e "Copying all ${MAGENTA}wallpapers${NORMAL}"
		cp -r wallpapers/* ~/Pictures/wallpapers || {
			echo "${RED}Failed to copy wallpapers.${NORMAL}"
			exit 1
		}
		sleep 0.2

		# Copy the hardware configuration (assume it's post-minimal-install)
		if [[ -f /etc/nixos/hardware-configuration.nix ]]; then
			echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${hostname}/${NORMAL}\n"
			cp /etc/nixos/hardware-configuration.nix hosts/${hostname}/hardware-configuration.nix || {
				echo "${RED}Failed to copy hardware config.${NORMAL}"
				exit 1
			}
		else
			echo "${YELLOW}Warning: /etc/nixos/hardware-configuration.nix not found. Generate it with 'nixos-generate-config' if needed.${NORMAL}"
		fi
		sleep 0.2

	elif [[ "$SYSTEM" == "darwin" ]]; then
		# Check if Nix is installed
		if ! command -v nix &>/dev/null; then
			echo "Installing Nix package manager..."
			sh <(curl -L https://nixos.org/nix/install) || {
				echo "${RED}Failed to install Nix.${NORMAL}"
				exit 1
			}
			. ~/.nix-profile/etc/profile.d/nix.sh
			mkdir -p ~/.config/nix
			echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf
		fi
	else
		echo "${RED}Invalid system type selected.${NORMAL}"
		exit 1
	fi

	# Confirmation before system build
	echo -en "You are about to start the system build, do you want to proceed? "
	confirm

	echo -e "Pushing to your GitHub Repo..."
	git add . || {
		echo "${RED}Git add failed.${NORMAL}"
		exit 1
	}
	git commit -m "new host" || {
		echo "${RED}Git commit failed.${NORMAL}"
		exit 1
	}
	git push || {
		echo "${RED}Git push failed (check SSH/permissions).${NORMAL}"
		exit 1
	}

	# Build the system (flakes + home manager)
	echo -e "\nBuilding the system...\n"
	if [[ "$SYSTEM" == "nixos" ]]; then
		sudo nixos-rebuild switch --flake . || {
			echo "${RED}NixOS rebuild failed.${NORMAL}"
			exit 1
		}
	elif [[ "$SYSTEM" == "darwin" ]]; then
		sudo nix run github:lnl7/nix-darwin#darwin-rebuild -- switch --flake .
		sudo darwin-rebuild switch --flake . || {
			echo "${RED}Darwin rebuild failed (try with sudo if needed).${NORMAL}"
			exit 1
		}
	fi

	echo "${GREEN}Installation complete! Reboot or test your setup.${NORMAL}"
}

main() {
	init
	print_header
	set_username
	set_system
	set_host
	set_hostname
	generate_host_template
	set_github
	set_ssh
	create_user_info
	install
}

main && exit 0
