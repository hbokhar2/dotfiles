local vars = require("modules.vars")
require("modules.keybinds").setup(vars)
require("modules.monitors")
require("modules.autostart")
require("modules.decorations")
require("modules.animations")
require("modules.mouse")
require("modules.workspaces")
require("modules.window-rules")


-----------------------
----- PERMISSIONS -----
-----------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--    ecosystem = {
--      enforce_permissions = true,
--    },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
