{ config, pkgs, ... }:

{
  home.username = "jacob";
  home.homeDirectory = "/var/home/jacob";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (writeShellScriptBin "nix-upgrade" ''
      home-manager switch --flake /var/home/jacob/andromeda/nix#jacob --impure
    '')
    fira-code-nerdfont
    pfetch-rs
    cosign
    nwg-look
    qt5ct
    qt6ct
    cliphist
    nixgl.auto.nixGLDefault
  ];

  # Import applications with configurations from apps/ directory
  imports = [
    ./apps/kitty.nix
    ./apps/neovim.nix
    ./apps/syncthing.nix
    ./apps/nix-direnv.nix
    ./apps/zsh.nix
    ./apps/btop.nix
    ./apps/git.nix
    ./apps/bash.nix
    ./apps/starship.nix
    ./apps/hyprpaper.nix
    ./apps/spotify.nix
    ./apps/zathura.nix
    #./apps/hyprlock.nix
    ./apps/hypridle.nix
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = {
  #  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  #  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  #  # # symlink to the Nix store copy.
  #  # ".screenrc".source = dotfiles/screenrc;

  #  # # You can also set the file content immediately.
  #  # ".gradle/gradle.properties".text = ''
  #  #   org.gradle.console=verbose
  #  #   org.gradle.daemon.idletimeout=3600000
  #  # '';
  #};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jacob/etc/profile.d/hm-session-vars.sh
  #
  #home.sessionVariables = {
  #  # EDITOR = "emacs";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
