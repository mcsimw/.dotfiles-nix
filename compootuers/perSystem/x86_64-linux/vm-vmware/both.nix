{
  pkgs,
  system,
  self,
  ...
}:
{
  imports = [
    ./hardware.nix

    self.nixosModules.dwl
  ];
  environment.systemPackages = with pkgs; [
    wget
    qutebrowser
  ];
  programs = {
    neovim.enable = true;
  };
  services.openssh.enable = true;
  system.stateVersion = "25.05";
}
