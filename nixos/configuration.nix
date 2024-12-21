# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
  ];


  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Bootloader.
  boot = {
    initrd.systemd.enable = true;
    kernelParams = [ "quiet" "splash" ];
    loader = {
      systemd-boot.enable = true;
    };
  };

  system.copySystemConfiguration
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  services = {
    upower.enable = true;
    blueman.enable = true;

    xserver = {
      enable = true;
      xkb.options = "caps:escape";
      displayManager = {
        #defaultSession = "none+xmonad";
        lightdm = {
          enable = true;
	      greeters.slick = {
	        enable = true;
	        extraConfig = ''
              background = ./night.jpg;
	        '';
	      };
        };
      };
      windowManager.bspwm.enable = true;
      /*
      windowManager.xmonad = {
        enable = true;
	    enableContribAndExtras = true;
      };
      */
    };
  };

  #services.xserver.desktopManager.budgie.enable = true;

  users.users.malcolm = {
    isNormalUser = true;
    description = "Malcolm";
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = rec {
    THEME_COLOR = "#7aa2f7";
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME" + "/.config";
  };

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
  system.stateVersion = "24.11"; # Did you read the comment?

}
