{pkgs, lib, ...}:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;
    extraPlugins = with pkgs; [
      postgresql17Packages.postgis
    ];

    # Set the listen addresses for PostgreSQL
    settings = {
      listen_addresses = "*";  # Change to "localhost" if you don't need remote access
    };

    # Enable TCP/IP for remote connections
    enableTCPIP = true;

    # Configure the authentication methods
    authentication = pkgs.lib.mkOverride 10 ''
      # Local connections (using Unix socket)
      local   all       all       trust

      # IPv6 localhost connections (trust)
      host    all       all       ::1/128    trust

      # IPv4 localhost connections (trust)
      host    all       postgres  127.0.0.1/32 trust
    '';
  };

  systemd.services.postgresql = {
    wantedBy = lib.mkForce [];
  };

  environment.systemPackages = with pkgs; [
    sqlite
    mariadb
  ];
}
