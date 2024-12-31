#!/usr/bin/env bash

init() {
    CURRENT_USERNAME="rikand"
    CURRENT_HOSTNAME="home-desktop"
    TEMPLATE_DIR="templates"
    HOST_DIR="hosts"
    # Colors
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
}

confirm() {
    echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
    read -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 0
    fi
}

print_header() {
    echo -E "
                    $CYAN Rikand Nix installation
                  $BLUE https://github.com/Rikardp98 $RED
      ! To make sure everything runs correctly DONT run as root ! $GREEN
                        -> '"./install.sh"' $NORMAL

    "
}

set_username() {
    echo -en "Enter your${GREEN} username${NORMAL}: $YELLOW"
    read username
    echo -e "${NORMAL}Use${YELLOW} $username${NORMAL} as ${GREEN}username${NORMAL}? "
    confirm

    # Perform a global search and replace for username in flake.nix and other relevant files
    sed -i '' -e "s/${CURRENT_USERNAME}/${username}/g" ./flake.nix
    sed -i '' -e "s/${CURRENT_USERNAME}/${username}/g" ./install.sh
    echo "Username set to $username."
}

set_system() {
    echo -en "Choose the ${GREEN}system type${NORMAL} - [${YELLOW}N${NORMAL}]ixOS, [${YELLOW}D${NORMAL}]arwin: "
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        SYSTEM="nixos"
    elif [[ $REPLY =~ ^[Dd]$ ]]; then
        SYSTEM="darwin"
    else
        echo "Invalid choice. Please select 'N' for NixOS or 'D' for Darwin."
        exit 1
    fi
    echo "System set to $SYSTEM."
}

set_host() {
    echo -en "Choose the ${GREEN}host${NORMAL} - [${YELLOW}D${NORMAL}]esktop, [${YELLOW}L${NORMAL}]aptop, [${YELLOW}V${NORMAL}]M: "
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Dd]$ ]]; then
        HOST="desktop"
    elif [[ $REPLY =~ ^[Ll]$ ]]; then
        HOST="laptop"
    elif [[ $REPLY =~ ^[Vv]$ ]]; then
        HOST="vm"
    else
        echo "Invalid choice. Please select 'D', 'L', or 'V'."
        exit 1
    fi
    echo "Host set to $HOST."
}

set_hostname() {
    echo -en "Enter your ${GREEN}hostname${NORMAL}: $YELLOW"
    read hostname
    echo -e "${NORMAL}Use${YELLOW} $hostname${NORMAL} as ${GREEN}hostname${NORMAL}? "
    confirm

    sed -i -e "s/${CURRENT_HOSTNAME}/${hostname}/g" ./flake.nix
    sed -i -e "s/${CURRENT_HOSTNAME}/${hostname}/g" ./install.sh
}

generate_host_template() {
    TARGET_DIR="$HOST_DIR/$hostname"
    TEMPLATE_FILE="$HOST_DIR/$TEMPLATE_DIR/$SYSTEM.$HOST.nix"

    echo "Generating host template..."
    mkdir -p "$TARGET_DIR"
    cp "$TEMPLATE_FILE" "$TARGET_DIR/default.nix"

    echo "Host template generated at $TARGET_DIR/default.nix."
}

install() {
    echo -e "\n${RED}START INSTALL PHASE${NORMAL}\n"
    sleep 0.2

    if [[ "$SYSTEM" == "nixos" ]]; then
        # Create basic directories
        echo -e "Creating folders:"
        echo -e "    - ${MAGENTA}~/Music${NORMAL}"
        echo -e "    - ${MAGENTA}~/Video${NORMAL}"
        echo -e "    - ${MAGENTA}~/Documents${NORMAL}"
        echo -e "    - ${MAGENTA}~/Pictures/wallpapers/others${NORMAL}"
        mkdir -p ~/Music ~/Video ~/Documents ~/Pictures/wallpapers/others
        sleep 0.2

        # Copy the wallpapers
        echo -e "Copying all ${MAGENTA}wallpapers${NORMAL}"
        cp -r wallpapers/wallpaper.png ~/Pictures/wallpapers
        cp -r wallpapers/otherWallpaper/gruvbox/* ~/Pictures/wallpapers/others/
        cp -r wallpapers/otherWallpaper/nixos/* ~/Pictures/wallpapers/others/
        sleep 0.2

        # Copy the hardware configuration
        echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${hostname}/${NORMAL}\n"
        cp /etc/nixos/hardware-configuration.nix hosts/${hostname}/hardware-configuration.nix
        sleep 0.2

    elif [[ "$SYSTEM" == "darwin" ]]; then
        # Check if Nix is installed
        if ! command -v nix &>/dev/null; then
            echo "Installing Nix package manager..."
            sh <(curl -L https://nixos.org/nix/install)
            . ~/.nix-profile/etc/profile.d/nix.sh
            mkdir -p ~/.config/nix
            echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
        fi
    else
        echo "Invalid system type selected."
        exit 1
    fi

    # Confirmation before system build
    echo -en "You are about to start the system build, do you want to proceed? "
    confirm

    # Build the system (flakes + home manager)
    echo -e "\nBuilding the system...\n"
    if [[ "$SYSTEM" == "nixos" ]]; then
        sudo nixos-rebuild switch --flake .#nixos 
    elif [[ "$SYSTEM" == "darwin" ]]; then
        sudo darwin-rebuild switch --flake .#darwin
    fi
}

main() {
    init

    print_header

    set_username
    set_system
    set_host
    set_hostname
    generate_host_template

    install
}

main && exit 0
