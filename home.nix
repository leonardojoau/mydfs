{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.11";
  home.username = "leo";
  home.homeDirectory = "/home/leo";
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.awscli = {
      enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "neovim-fhs";
    NVIM_BIN = "neovim-fhs";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  home.packages = with pkgs; [
    zsh
    zsh-completions
    zsh-autosuggestions
    gcc
    stdenv.cc.cc.lib
    rustup
    python3
    python3Packages.pip
    python3Packages.virtualenv
    poetry
    lsof
    nodejs
    (pkgs.buildFHSUserEnv {
      name = "neovim-fhs";
      targetPkgs = pkgs: with pkgs; [ neovim ];
      runScript = "nvim";
    })
  ];

  home.file.".zprofile".text = ''
    if [ -e /etc/profile.d/nix.sh ]; then . /etc/profile.d/nix.sh; fi
  '';

  home.file.".zshrc".text = ''
    # Load zsh-autosuggestions
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  '';
}
