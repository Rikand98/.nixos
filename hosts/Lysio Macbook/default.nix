{ pkgs, config, ... }:
{
  imports = [
    ./../../modules/core/darwin
  ];

  # Packages relevant for macOS
  environment.systemPackages = with pkgs; [
    smcfancontrol  # Optional: For fan control on older Macs; limited use on Apple Silicon
    # Add macOS-compatible tools, e.g., for monitoring
    htop
    neofetch
  ];

  # UPower for battery monitoring (optional, minimal effect on macOS)
  services.upower = {
    enable = true;
    percentageLow = 20;
    percentageCritical = 5;
    percentageAction = 3;
    criticalPowerAction = "Hibernate";  # macOS supports Sleep/Hibernate, not PowerOff
  };

  # macOS-specific power management settings (minimal, as Apple Silicon is firmware-driven)
  powerManagement = {
    enable = true;  # Enables basic nix-darwin power management hooks
    # No CPU governor settings; macOS handles this internally
  };

  # No kernel modules needed for macOS
  boot = {
    # Remove Linux-specific kernelModules and extraModulePackages
    # Add any macOS-specific boot settings if needed (rare for Apple Silicon)
  };

  # Optional: Enable nix-darwin-specific optimizations
  nixpkgs.hostPlatform = "aarch64-darwin";  # Ensure native ARM builds
}
