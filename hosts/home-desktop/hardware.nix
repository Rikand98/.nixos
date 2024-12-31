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
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [
  "amdgpu.dc=1"
  "amdgpu.dpm=1"
  "amdgpu.si_support=1"
  "amdgpu.cik_support=1"
  "radeon.si_support=0"
  "radeon.cik_support=0"
  "video=DVI-D-2:1920x1080@144"
  "video=HDM1-A-1:1920x1080@60"
  ];
  environment.systemPackages = with pkgs; [
    amdgpu_top
    lm_sensors          #system/hardware monitor
  ];
}
