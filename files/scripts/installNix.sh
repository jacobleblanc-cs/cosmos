#!/usr/bin/env bash
set -oue pipefail
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --determinate --no-confirm --no-start-daemon
