{ pkgs, ... }:
# These are settings for my old amd gpu (r390x)
{
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ mesa ];
    };
    amdgpu = {
      amdvlk = {
        enable = true;
        support32Bit.enable = true;
      };
      initrd.enable = true;
      opencl.enable = true;
    };
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
  "amdgpu.dc=1"
  "amdgpu.dpm=1"
  ];
  environment.systemPackages = with pkgs; [
    lact
    amdgpu_top
    lm_sensors          #system/hardware monitor
  ];
}
