{pkgs, ...}:
let
myNeovim = pkgs.neovim.override {
    configure = {
        packages.nix.start = [
            { plugin = pkgs.vimPlugins.dracula-nvim; }
        ];
        customRC = "lua << EOF\n" + builtins.readFile ./nvim-init.lua + "\nEOF\n";
    };
};

in

{
    home.stateVersion = "25.05";
    home.username = "ju";
    home.homeDirectory = "/home/ju";

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [ 
        neovide
        myNeovim
        neofetch
        oath-toolkit
        lazygit
        jetbrains.idea-ultimate
        tree
    ];
    programs.bash = {
        enable = true;
        shellAliases = {
            vim = "nvim";
            nix-rebuild  = "sudo nixos-rebuild switch --flake ~/Documents/nixos-setup#nixos";
            home-rebuild = "home-manager switch --flake ~/Documents/nixos-setup#ju";
        };
        initExtra = ''
            set -o vi
            bind 'set completion-ignore-case on'
            '';
        sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
        };
    };
    programs.git = {
        enable = true;
        userEmail = "71655937+Hiqqup@users.noreply.github.com"; 
        userName  = "hiqqup";# these two unfortuantely do nothing
    };

    dconf.settings = {
        "org/gnome/desktop/interface" ={
            color-scheme =  "prefer-dark";
        };
        "org/gnome/mutter" =  {
            dynamic-workspaces  = false;
        };
        "org/gnome/desktop/wm/preferences" ={ 
            num-workspaces=  6;
        };
        "org/gnome/desktop/wm/keybindings" = { 
            switch-to-workspace-1 =  ["<Alt>1"];
            switch-to-workspace-2 =  ["<Alt>2"];
            switch-to-workspace-3 =  ["<Alt>3"];
            switch-to-workspace-4 =  ["<Alt>4"];
            switch-to-workspace-5 =  ["<Alt>5"];
            switch-to-workspace-6 =  ["<Alt>6"];
            move-to-workspace-1 =  ["<Shift><Alt>1"];
            move-to-workspace-2 =  ["<Shift><Alt>2"];
            move-to-workspace-3 =  ["<Shift><Alt>3"];
            move-to-workspace-4 =  ["<Shift><Alt>4"];
            move-to-workspace-5 =  ["<Shift><Alt>5"];
            move-to-workspace-6 =  ["<Shift><Alt>6"];
            close = ["<Shift><Alt>c"];
        };

        "org/gnome/shell/app-switcher" ={current-workspace-only  = true;};
        "org/gnome/desktop/peripherals/touchpad" = { click-method =  "areas";};
        "org/gnome/shell" = {
            favorite-apps = [];
        };

    };

}

