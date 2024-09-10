{ pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "~/Pictures/Wallpapers/jwst-carrina.png" ];
      wallpaper = [
        "eDP-1,~/Pictures/Wallpapers/jwst-carrina.png"
        "DP-2,~/Pictures/Wallpapers/jwst-carrina.png"
      ];
    };
  };
}
