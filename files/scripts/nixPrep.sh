#!/usr/bin/env bash
set -oue pipefail
rpm-ostree initramfs --enable --arg=-i --arg=/etc/ostree/prepare-root.conf --arg=/usr/lib/ostree/prepare-root.conf
