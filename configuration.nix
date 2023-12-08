
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
  
  #environment variables
  environment = {
    variables.EDITOR = "vim";
    
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";  
    };
  };

  #networking
  networking = {
    hostName = "nixos"; # Define your hostname.
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
  };
  services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

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

  #hyprland
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  #shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
 
  #graphics settings
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };

  #xserver settings
  services.xserver = {
    videoDrivers = ["nvidia"];
    enable = true;
    #kde and sddm
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = false;
    #keymap
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ethan = {
    isNormalUser = true;
    description = "Ethan";
    extraGroups = [ "networkmanager" "wheel" ];
    useDefaultShell = true;
    packages = with pkgs; [
      firefox
    ];
  };
  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["FiraCode"]; } )
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    waybar
    kitty
    wofi
    zsh
    neofetch
    networkmanagerapplet
    hyprpaper
    psmisc
    git
    fzf
    stow
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}
