[NixOS](https://nixos.org/) image builder compatible with [Yandex.Cloud](https://cloud.yandex.ru/)

Image can be built with command:

    NIXOS_CONFIG=$(pwd)/yandex-cloud-image-builder.nix nix-build '<nixpkgs/nixos>' -A config.system.build.qcow2

Scripts based on https://gist.github.com/tarnacious/f9674436fff0efeb4bb6585c79a3b9ff