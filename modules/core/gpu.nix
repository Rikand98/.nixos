{ pkgs, ... }:
#TODO#
{
  boot.kernelParams = [
  "amdgpu.si_support=0"
  "amdgpu.dc=1"
  "amdgpu.dpm=1"
  "radeon.si_support=0"
  "video=DVI-D-2:1920x1080@144"
  "video=HDM1-A-1:1920x1080@60"
  ];
}
