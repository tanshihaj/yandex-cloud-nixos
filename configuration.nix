{ ... }:

{
  imports = [
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];
              
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
    autoResize = true;
  };

  boot.growPartition = true;
  boot.kernelParams = [ "console=ttyS0" ];
  boot.loader.grub.device = "/dev/vda";
  boot.loader.timeout = 0;

  users.extraUsers.root.password = "";

  services = {
    cloud-init = {
      enable = true;
    };
    openssh = {
      enable = true;
      listenAddresses = [ { addr = "0.0.0.0"; port = 22; } ];
    };
  };
}