{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  # amdgpu.dc=1 / amdgpu.dpm=1 are already the kernel defaults.

  # lact GUI needs the daemon to actually apply GPU settings.
  services.lact.enable = true;

  environment.systemPackages = with pkgs; [
    lact
    amdgpu_top
    clinfo
  ];
}
