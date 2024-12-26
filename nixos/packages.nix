{ config, pkgs, ... }:

let
  dmenu = import ./dmenu.nix { inherit pkgs; };
in
{
  environment.systemPackages = with pkgs; [
    #custom Packages
    dmenu

    #bspwm
    bspwm
    pipewire
    nitrogen
    picom
    blueman
    sxhkd
    polybar
    dunst

    #other
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
    (python3.withPackages(ps: with ps; [requests]))
    pyright
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
    networkmanagerapplet
    pulseaudio
    librewolf-bin
    networkmanager_dmenu
    xorg.xev
    xclip
    meld
    xfce.xfce4-screenshooter
    plymouth
    wget
    qogir-theme
    qogir-icon-theme
    feh
    rustc
    rust-analyzer-unwrapped
    cargo
    retroarch
    gcc
    tree
  ];
}

