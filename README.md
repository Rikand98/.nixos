<h1 align="center">
    <img src="./.github/assets/logo/nixos-logo.png  " width="100px" />
    <br>
    Rikand NixOS
    <br>
    <img src="./.github/assets/pallet/pallet-0.png" width="600px" /> <br>
</h1>

### 🖼️ Gallery

<p align="center">
    <img src="./.github/assets/screenshots/1.png" style="margin-bottom: 10px;"/> <br>
    <img src="./.github/assets/screenshots/2.png" style="margin-bottom: 10px;"/> <br>
    <img src="./.github/assets/screenshots/3.png" style="margin-bottom: 10px;"/> <br>
    Screenshots last updated <b>2024-11-13</b>
</p>

<details>
    <summary>
        Hyprlock (EXPAND)
    </summary>
    <p align="center">
        <img src="./.github/assets/screenshots/hyprlock.png" style="margin-bottom: 10px;" /> <br>
    </p>
</details>

# 🗃️ Overview
> [!TIP]
> Great commands for cleaning and optimising your nixos system
> ```nix store optimise``` and
> ```nix store gc```

## 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) 🌳 per-host configurations that contain machine specific configurations
-   [modules](modules) 🍱 modularized NixOS configurations
-   [core](modules/core/) ⚙️ Core NixOS configuration
-   [homes](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [pkgs](flake/pkgs) 📦 Packages Build from source
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

## 📓 Components
|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Bar**                     | [Waybar][Waybar] |
| **Application Launcher**    | [rofi][rofi] |
| **Notification Daemon**     | [swaync][swaync] |
| **Terminal Emulator**       | [Ghostty][Ghostty] |
| **Shell**                   | [fish][fish] |
| **Text Editor**             | [Neovim][Neovim] |
| **Browser**                 | [Zen][Zen] |
| **network management tool** | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **File Manager**            | [yazi][yazi] |
| **Fonts**                   | [CascadiaCode Nerd Font][Nerd fonts] + [JetBrainsMono Nerd Font][Nerd fonts] |
| **Color Scheme**            | [Gruvbox Dark Hard][Gruvbox] |
| **Cursor**                  | [Capitaine Cursors][Capitaine-Cursors] |
| **Icons**                   | [Gruvbox-plus][Gruvbox-plus] |
| **Lockscreen**              | [Hyprlock][Hyprlock] + [Swaylock-effects][Swaylock-effects] |
| **Image Viewer**            | [qview][qview] |
| **Media Player**            | [mpv][mpv] |
| **Music Player**            | [audacious][audacious] |
| **Screenshot Software**     | [grimblast][grimblast] |
| **Screen Recording**        | [wf-recorder][wf-recorder] |
| **Clipboard**               | [wl-clip-persist][wl-clip-persist] |
| **Color Picker**            | [hyprpicker][hyprpicker] |

</details>

# 🚀 Installation

> [!CAUTION]
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly for you.
> **I am not responsible for any issues that may arise from using this configuration.**

> [!NOTE]
> It is highly recommended to review the configuration contents and make necessary modifications to customize it to your needs before attempting the installation.

#### 1. **Install NixOs**

First install nixos using any [graphical ISO image](https://nixos.org/download.html#nixos-iso).
> [!NOTE]
> Only been tested using the Gnome graphical installer and choosing the ```No desktop``` option durring instalation.

#### 2. **Clone the repo**

```bash
nix-shell -p git
git clone https://github.com/Rikardp98/.nixos
cd nixos-config
```
#### 3. **Install script**
> [!CAUTION]
> For some computers, the default rebuild command might get stuck due to CPU cores running out of RAM. To fix that modify the install script line: ```sudo nixos-rebuild switch --flake .#${HOST}``` to ```sudo nixos-rebuild switch --cores <less than your max number of cores> --flake .#${HOST}```

> [!TIP]
> As it is better to know what a script does before running it, you are advised to read it or at least see the [Install script walkthrough](#Install-script-walkthrough) section before execution.

Execute and follow the installation script :
```bash
./install.sh
```

#### 4. **Reboot**

After rebooting, the config should be applied, you'll be greeted by hyprlock prompting for your password.

#### 5. **Manual config**

Even though I use home manager, there is still a little bit of manual configuration to do:
- Enable Discord theme (in Discord settings under VENCORD > Themes).
- Configure hardware specific settings in hosts/hostname/hardware.nix

## Install script walkthrough

This section provides a detailed walkthrough of what the `install.sh` script does during the installation process.

### 1. **Get username**

The script will prompt you to enter your desired username. After entering your username, it will ask for confirmation to ensure the provided username is correct.

### 2. **Set username**

Once you've confirmed the username, the script will replace all occurrences of the default username `CURRENT_USERNAME` in the following files with the username you provided:
- `flake.nix`
- `install.sh`

This ensures that the configurations are personalized for the correct username.

### 3. **Set system type**

The script will ask you to choose between two system types:
- **NixOS**: Select this if you are installing NixOS.
- **Darwin**: Select this if you are installing macOS (for example, if you are setting up a macOS environment using Nix).

### 4. **Set host type**

The script will then prompt you to choose your system's host type:
- **Desktop**: Choose this if you're using a desktop computer.
- **Laptop**: Choose this if you're using a laptop.
- **VM**: Choose this if you're setting up a virtual machine.

This allows the script to generate specific configurations based on your system’s hardware.

### 5. **Set hostname**

The script will prompt you to enter a custom hostname for your system. After you provide the hostname, it will ask for confirmation. Once confirmed, the script will replace all occurrences of the default hostname `CURRENT_HOSTNAME` in the following files:
- `flake.nix`
- `install.sh`

This ensures that the configurations are personalized for the correct hostname.

### 6. **Generate host template**

The script will generate a host-specific template for configuration:
- It will create a target directory for your host inside the `hosts` directory.
- The template will be copied from the `templates` directory based on the system and host type you selected.

This allows for a customized NixOS or macOS setup based on your specific hardware and preferences.

### 7. **Create basic directories**

For NixOS installations, the script will create a few basic directories if they don't already exist:
- `~/Music`
- `~/Videos`
- `~/Documents`
- `~/Pictures/wallpapers`

These directories will be used to store music, videos, documents, and wallpapers for your setup.

### 8. **Copy wallpapers**

The script will copy the wallpapers into the `~/Pictures/wallpapers` directory.

### 9. **Get hardware configuration**

The script will automatically copy the hardware configuration from `/etc/nixos/hardware-configuration.nix` to `./hosts/${HOST}/hardware-configuration.nix`. This ensures that your specific hardware configuration is included and not the default one.

### 10. **Confirm before proceeding**

Before the final system build, the script will prompt you to confirm whether you want to proceed with the installation.

### 11. **Build the system**

Finally, the script will start the process of rebuilding the system using the flake configuration. Depending on the system type you selected (NixOS or Darwin), it will run the appropriate rebuild command:
- For NixOS, it will run `sudo nixos-rebuild switch --flake .#nixos`.
- For macOS (Darwin), it will run `sudo darwin-rebuild switch --flake .#darwin`.

This builds and applies the configuration to your system.

# 👥 Credits

Other dotfiles that I learned / copy from:

- Nix Flakes
  - [Frost-Phoenix/nixos-config](https://github.com/Frost-Phoenix/nixos-config) Heavily based on this config!

<!-- # ✨ Stars History -->

<!-- <p align="center"><img src="https://api.star-history.com/svg?repos=frost-phoenix/nixos-config&type=Timeline&theme=dark" /></p> -->

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>

<!-- end of page, send back to the top -->

<div align="right">
  <a href="#readme">Back to the Top</a>
</div>

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Ghostty]: https://github.com/ghostty-org/ghostty
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[rofi]: https://github.com/lbonn/rofi
[Btop]: https://github.com/aristocratos/btop
[nemo]: https://github.com/linuxmint/nemo/
[yazi]: https://github.com/sxyazi/yazi
[fish]: https://fishshell.com/
[Swaylock-effects]: https://github.com/mortie/swaylock-effects
[Hyprlock]: https://github.com/hyprwm/hyprlock
[audacious]: https://audacious-media-player.org/
[mpv]: https://github.com/mpv-player/mpv
[Neovim]: https://github.com/neovim/neovim
[grimblast]: https://github.com/hyprwm/contrib
[qview]: https://interversehq.com/qview/
[swaync]: https://github.com/ErikReider/SwayNotificationCenter
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[wl-clip-persist]: https://github.com/Linus789/wl-clip-persist
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Gruvbox]: https://github.com/morhetz/gruvbox
[Gruvbox-Plus]: https://github.com/SylEleuth/gruvbox-plus-icon-pack
[Capitaine-Cursors]: https://github.com/sainnhe/capitaine-cursors
[maxfetch]: https://github.com/jobcmax/maxfetch
[Zen]: https://zen-browser.app/
