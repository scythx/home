{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "scythx";
  home.homeDirectory = "/home/scythx";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.overpass

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.bat
    pkgs.fd
    pkgs.grc

    pkgs.asciinema
    pkgs.ripgrep
    pkgs.lazygit

    pkgs.bitwarden-cli
    
    pkgs.waybar
    pkgs.rofi-wayland
    pkgs.dunst

    pkgs.python3

    pkgs.poetry
    #pkgs.go

    # Cloud tools
    pkgs.doctl
    pkgs.fluxcd
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.linkerd_edge
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {


    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  #  /etc/profiles/per-user/scythx/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  
  home.shellAliases = {
    dotfiles = "git --git-dir=$HOME/.dotfiles --work-tree=$HOME";
    cat = "bat";
  };

  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;

  xdg.enable = true;
  xdg.mime.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ -f $HOME/.config/bash/.bashrc ]]; then
        . $HOME/.config/bash/.bashrc
      fi 
    '';
    profileExtra = ''
      if [[ -f $HOME/.config/bash/.bash_profile ]]; then
        . $HOME/.config/bash/.bash_profile
      fi 
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test -f $HOME/.config/fish/config.interactive.fish
        source $HOME/.config/fish/config.interactive.fish
      end
    '';
    plugins = [
      { name = "bass"; src = pkgs.fishPlugins.bass.src; }
      { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];
  };

  programs.direnv.enable = true;
  programs.fzf.enable = true;
  programs.git.enable = true;
  programs.pyenv.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
