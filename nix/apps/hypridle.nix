{ pkgs, ... }:

{
  home.packages = [ pkgs.hypridle ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
	before_sleep_cmd = "loginctl lock-session";
	after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        # 2.5 Minute Timer: Dim screen to 10%
        {
	  timeout = 150;
	  on-timeout = "brightnessctl -s set 10";
	  on-resume = "brightnessctl -r";
	}
	# 2.5 Minute Timer: Disable keyboard backlight
	{
	  timeout = 150;
	  on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
	  on-resume = "brightnessctl -rd rgb:kbd_backlight";
	}
	# 5 Minute Timer: Lock screen
        {
	  timeout = 300;
	  on-timeout = "loginctl lock-session";
	}
	# 5.5 Minute Timer: Turn off display
	{
	  timeout = 330;
	  on-timeout = "hyprctl dispatch dpms off";
	  on-resume = "hyprctl dispatch dpms on";
	}
	# 20 Minute Timer: Suspend PC
	{
	  timeout = 1200;
	  on-timeout = "systemctl suspend";
	}
      ];
    };
  };
}
