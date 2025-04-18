{
  inputs,
  pkgs,
  config,
  ...
}:
{
  services.blueman.enable = config.hardware.bluetooth.enable;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    wlr.enable = true;
  };

  programs.foot = {
    enable = true;
    package = inputs.nixpkgs.legacyPackages.${pkgs.system}.foot; # nixpkgs-wayland's foot won't compile for now :(
    settings = {
      main = {
        font = "Spleen:size=12, Symbols Nerd Font Mono:size=9, Apple Color Emoji:size=9";
        "font-size-adjustment" = 6;
        pad = "40x40";
      };
      cursor = {
        color = "ffffff cc0077";
      };
      colors = {
        foreground = "ffffff";
        background = "000000";
        "selection-foreground" = "000000";
        "selection-background" = "cc0077";
        urls = "88ccff";
        regular0 = "000000";
        regular1 = "ee2a2a";
        regular2 = "2c9917";
        regular3 = "e6c800";
        regular4 = "1e60b0";
        regular5 = "ff5fae";
        regular6 = "00cccc";
        regular7 = "d0d0d0";
        bright0 = "3a3a3a";
        bright1 = "ff5555";
        bright2 = "53b53e";
        bright3 = "ffff55";
        bright4 = "3d89db";
        bright5 = "ff85d7";
        bright6 = "33ffff";
        bright7 = "ffffff";
        "16" = "ffae00";
        "17" = "ff7755";
      };
    };

  };

  environment.systemPackages = with pkgs; [
    inputs.nixpkgs.legacyPackages.${pkgs.system}.wlvncc # nixpkgs-wayland's wlvncc won't compile for now :(
    pwvucontrol_git
    wl-clipboard-rs
    wmenu
    sway-contrib.grimshot
    slurp
    imv
    zathura
    swaybg
    mako
  ];
}
