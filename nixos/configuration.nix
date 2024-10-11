# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Bootloader.
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot.enable = true;
      #grub = {
      #  enable = true;
      #  efiSupport = true;
      #  #efiInstallAsRemovable = true;
      #  device = "nodev";
      #  useOSProber = true;
      #};
    };
    initrd.systemd.enable = true;
    kernelParams = [ "quiet" "splash" ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  #services.displayManager.cosmic-greeter.enable = true;
  #services.desktopManager.cosmic.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.malcolm = {
    isNormalUser = true;
    description = "Malcolm";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;

  virtualisation.vmware.host.enable = true;
  services.upower.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #bspwm
    bspwm
    picom
    sxhkd
    nitrogen
    polybar
    networkmanagerapplet
    brightnessctl

    #budgie
    budgie.magpie
    budgie.budgie-session
    budgie.budgie-screensaver
    budgie.budgie-gsettings-overrides
    budgie.budgie-desktop-with-plugins
    budgie.budgie-desktop-view
    budgie.budgie-desktop
    budgie.budgie-control-center
    budgie.budgie-backgrounds

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
    (python3.withPackages(ps: with ps; [ requests ]))
    github-desktop
    chromium
    android-studio
    cowsay
    ccrypt
    plymouth
    nettools
    gparted
    signal-desktop
    unzip
    tmux
    kitty
    file
    patchelf
    cmake
    btop
    mesa
    dmenu
    os-prober
    bat
    distrobox
    xclip
    alsa-utils
    upower
    blueman
    rofi
    killall
    pulseaudio
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  systemd.services.ssh-tunnel = {
    enable = true;
    description = "ssh socks5 tunnel";
    serviceConfig = {
      User = "malcolm";
      ExecStart = "${pkgs.bash}/bin/bash -c 'while true; do ${pkgs.openssh}/bin/ssh -p1495 -ND 9999 malcolm@24.28.1.246; sleep 10; done'";
    };
    wantedBy = [ "multi-user.target" ]; # starts after login
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
