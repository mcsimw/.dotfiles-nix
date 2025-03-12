{
  self,
  inputs',
  packages,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware.nix

    self.nixosModules.dwl
  ];
  programs = {
    neovim.enable = true;
    firefox = {
      enable = true;
      package = inputs'.flake-firefox-nightly.packages.firefox-nightly-bin;
    };
  };
  environment.systemPackages = with pkgs; [
    gimp
    krita
    inkscape
    mpv
  ];
  services.openssh.enable = true;
  system.stateVersion = "25.05";
}
