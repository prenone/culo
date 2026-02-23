{ pkgs, ... } :
{
    programs.firefox = {
        enable = true;

        profiles = {
            default = {
                isDefault = true;
                id = 0;
                name = "default";
                settings = {
                    "browser.startup.homepage" = "https://achilleme.com";
                    "extensions.autoDisableScopes" = 0;
                    "extensions.enabledScopes" = 15;
                };
                extensions.force = true;
                extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
                    onepassword-password-manager
                ];
            };
        };
    };
}