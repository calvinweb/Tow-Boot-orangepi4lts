{ lib, ... }:

{
  device = {
    manufacturer = "Radxa";
    name = lib.mkDefault "ROCK Pi 4 model A/B";
    identifier = lib.mkDefault "radxa-RockPi4";
    productPageURL = "https://wiki.radxa.com/Rockpi4";
    supportLevel = "best-effort";
  };

  hardware = {
    soc = "rockchip-rk3399";

  };

  Tow-Boot = {
    defconfig = lib.mkDefault "orangepi-4-rk3399_defconfig";
    config = [
      (helpers: with helpers; {
        USE_PREBOOT = yes;
        PREBOOT = freeform ''"usb start"'';
      })
    ];
  };
}
