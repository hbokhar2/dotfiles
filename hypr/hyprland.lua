------------------
---- MONITORS ----
------------------
hl.monitor({
	output   = "DP-4",
	mode     = "5120x1440@240",
	position = "0x0",
	scale    = "1.25"
})

hl.monitor({
	output   = "DP-3",
	mode     = "1920x1080@164.92",
	position = "4096x0",
	scale	 = "1"
})


---------------------
---- MY PROGRAMS ----
---------------------
local terminal     = "kitty"
local fileManager  = "thunar"
local menu         = "fuzzel"
local audioControl = "pavucontrol"
local calculator   = "qalculate-gtk"


-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 1 DP-4")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 2 DP-4")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 3 DP-4")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 4 DP-3")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 5 DP-3")
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 6 DP-3")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_FORCE_DPI", "physical")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")


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



-------------------------
------ DECORATIONS ------
-------------------------
hl.config({
	xwayland = { force_zero_scaling = true, },
	general = {
		gaps_in  = 3,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	cursor = {
		no_hardware_cursors = true,
	},

	decoration = {
		rounding       = 4,
		rounding_power = 1,
		active_opacity   = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = 0x000000ee,
		},
		blur = {
			enabled   = true,
			size      = 2,
			passes    = 4,
			vibrancy  = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
		smart_resizing = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo   = false,
	},

	input = {
		kb_layout  = "us",
		kb_variant = "",
		kb_model   = "",
		kb_options = "",
		kb_rules   = "",
		follow_mouse = 1,
		sensitivity = 0,
		accel_profile = "flat",
		touchpad = {
			natural_scroll = false,
		},
	},
})


--------------------
---- ANIMATIONS ----
--------------------
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-----------------
---- GESTURES ----
-----------------
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})


-----------------
---- DEVICES ----
-----------------
hl.device({
	name        = "epic-mouse-v1",
	sensitivity = 0,
	accel_profile = "flat"
})


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(audioControl))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(calculator))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.window.float())

hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "down"}))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({direction = "down"}))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + Page_Up",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + Page_Down", hl.dsp.focus({ workspace = "m+1" }))
for i = 1, 6 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i}))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i}))
end


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.workspace_rule({ workspace = "1", monitor = "DP-4", default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-4", persistent = true})
hl.workspace_rule({ workspace = "3", monitor = "DP-4", persistent = true })

hl.workspace_rule({ workspace = "4", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-3", persistent = true})
hl.workspace_rule({ workspace = "6", monitor = "DP-3", persistent = true })

local suppressMaximizeRule = hl.window_rule({
	name  = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "pavucontrol-float",
	match = {class = "^(org.pulseaudio.pavucontrol)$"},
	size = {600, 675},
	move = {
		"min(max(cursor_x - 300, 0), monitor_w - 600)",
		"min(max(cursor_y - 337, 0), monitor_h - 675)"
	},
	float = true,
})

hl.window_rule({
	name = "qalculate-float",
	match = {class = "^(qalculate-gtk)$"},
	move = {
		"min(max(cursor_x - 350, 0), monitor_w - 700)",
		"min(max(cursor_y - 350, 0), monitor_h - 700)"
	},
	size = {700, 700},
	float = true,
})

hl.window_rule ({
	name = "performance-fullscreen",
	match = {fullscreen = true},
	no_blur = true,
})

hl.window_rule({
	name = "keepass-browser-popup-float",
	match = {
		class = "^(org.keepassxc.KeePassXC)$",
		title = "^(KeePassXC - Browser Access Request)$",
	},
	float = true,
})
