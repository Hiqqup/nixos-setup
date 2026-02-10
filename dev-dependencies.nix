{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    nodejs_22
    docker-compose
    maven
    apacheHttpd
  ];

  virtualisation.docker.enable = true;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;
  };
}
