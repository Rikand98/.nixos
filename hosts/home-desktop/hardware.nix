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
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
    "amdgpu.dc=1"
    "amdgpu.dpm=1"
  ];
  environment.systemPackages = with pkgs; [
    freetype
    (pkgsi686Linux.freetype) # 32-bit FreeType for Wine
    lact
    amdgpu_top
    mission-center
    mesa
    clinfo
  ];
}
