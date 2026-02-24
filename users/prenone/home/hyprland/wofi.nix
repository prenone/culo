{ ... }:
{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";
      width = 600;
      height = 400;
      location = "center";
      prompt = "Chi vo fari?";
      allow_images = true;
      insensitive = true;
    };
  };
}
