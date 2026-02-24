{ ... }:
let
  wp = toString ./wallpaper/test.jpg;
in
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ wp ];
      wallpaper = [ "eDP-1,${wp}" ];
    };
  };
}
