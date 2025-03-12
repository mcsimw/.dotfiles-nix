{
  pkgs,
  lib,
  inputs',
  ...
}:
{
  wrappers.google-chrome = {
    basePackage = inputs'.browser-previews.packages.${pkgs.system}.google-chrome-dev;
    flags = [
      "--enable-features=${
        lib.concatStringsSep "," [
          "WebUIDarkMode"
          "TouchpadOverscrollHistoryNavigation"
        ]
      }"
      "--force-dark-mode"
    ];
  };
}
