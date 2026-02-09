{ config, pkgs, ... }:

let
in
{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];
    nix.settings.experimental-features = ["nix-command" "flakes"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.xkb = {
        layout = "de";
        variant = "us";
    };
    console.keyMap = "de";
    services.printing.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    users.users.ju = {
        isNormalUser = true;
        description = "ju";
        extraGroups = [ "networkmanager" "wheel" ];
    };
    programs.firefox.enable = true;
    environment.systemPackages = with pkgs; [
        wl-clipboard
        libinput
        git
        unzip
        neovim
    ];
    system.stateVersion = "25.05"; # Did you read the comment05
}
