# Andromeda Configuration &nbsp; [![bluebuild build badge](https://github.com/jacobleblanc-cs/andromeda/actions/workflows/build.yml/badge.svg)](https://github.com/jacobleblanc-cs/andromeda/actions/workflows/build.yml)

This is a [custom BlueBuild image](https://github.com/blue-build/template) for my personal laptop/workstation. It is based on a [SecureBlue](https://github.com/secureblue/secureblue) image which is itself based on [Wayblue](https://github.com/wayblueorg/wayblue)'s Hyprland image.

This is an early WIP as I migrate from NixOS, but I will update this repository as changes come up. Do note that most of my package management and configuration are done through Nix + Home-Manager, installed via the Determinate Systems Installer. Nix configuration will be included soon.

Changes on this image so far:
 - Install tailscale
 - Remove wofi
 - Remove foot


## Installation


To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/jacobleblanc-cs/andromeda:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/jacobleblanc-cs/andromeda:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

Please note that you CANNOT rebase from SecureBlue into this image, as SecureBlue's policies do not allow it. Rebase into an image known to SecureBlue first, such as any of those it is built on top of, and then into the custom image.


## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/jacobleblanc-cs/andromeda
```
