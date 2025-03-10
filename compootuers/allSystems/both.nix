{ lib, pkgs, ... }:
{
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_cachyos;
  boot.zfs.package = lib.mkOverride 99 pkgs.zfs_cachyos;
  time.timeZone = lib.mkDefault "Canada/Eastern";
  security.sudo.wheelNeedsPassword = lib.mkDefault false;
  environment.systemPackages = with pkgs; [
    kakoune
  ];
  networking.useNetworkd = true;
  environment.variables.EDITOR = lib.mkForce "kak";
  systemd.oomd.enable = lib.mkDefault false;
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://chaotic-nyx.cachix.org"

    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8"
    ];
  };
}
