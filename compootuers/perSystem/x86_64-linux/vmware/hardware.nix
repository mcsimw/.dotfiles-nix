{ lib, pkgs, ... }:
{
  chaotic.mesa-git = {
    enable = true;
    fallbackSpecialisation = false;
  };
  virtualisation.vmware.guest.enable = true;
  systemd.targets = {
    sleep.enable = lib.mkForce false;
    suspend.enable = lib.mkForce false;
    hibernate.enable = lib.mkForce false;
    hybrid-sleep.enable = lib.mkForce false;
  };
  boot = {
    kernelPackages = lib.mkOverride 99 pkgs.linuxPackages_cachyos-rc;
    initrd = {
      systemd.enable = true;
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "ehci_pci"
        "ahci"
        "nvme"
        "sr_mod"
      ];
    };
  };
  services.scx = {
    enable = true;
    package = pkgs.scx-full_git;
    scheduler = "scx_bpfland";
  };
}
