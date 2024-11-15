{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    postgresql17Packages.postgis
    gdal
    sqlite
    mariadb
  ];
  config.services = {
      postgresql = {
        enable = true;
        package = pkgs.postgresql_17;
        authentication = pkgs.lib.mkOverride 10 ''
          # type  database  user  auth-method
          local   all       all   md5
        '';
      };
    };
}
