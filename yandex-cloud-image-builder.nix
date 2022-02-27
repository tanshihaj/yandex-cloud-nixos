{ config, lib, pkgs, ... }:

with lib;

{
  imports =
    [ 
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      ./configuration.nix
    ];

  system.build.qcow2 = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit lib config;
    pkgs = import <nixpkgs> { inherit (pkgs) system; }; # ensure we use the regular qemu-kvm package
    diskSize = 8192;
    format = "qcow2";
    configFile = ./configuration.nix;
  };
}