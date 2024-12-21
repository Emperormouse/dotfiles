{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bspwm
    pipewire
    nitrogen
    picom
    blueman
    sxhkd
    polybar

    git
    neovim
    alacritty
    htop
    neofetch
    nodejs_22
    cmatrix
    virtualbox
    discord
    vscodium
    flatpak
    gimp
    lutris
    superTuxKart
    superTux
    zsh
    (python3.withPackages(ps: with ps; [ requests]))
    github-desktop
    chromium
    cowsay
    ccrypt
    plymouth
    nettools
    gparted
    signal-desktop
    unzip
    rofi
    android-studio
    android-tools
    openjdk
    psmisc
    kitty
    btop
    bat
    upower
    brightnessctl
  ];
}

