return {

	hl.config({
		xwayland = { force_zero_scaling = true, },
		general = {
			gaps_in  = 3,
			gaps_out = 10,
			border_size = 2,
			col = {
				active_border   = { colors = {"rgba(d3d3ffee)", "rgba(090933ee)"}, angle = 45 },
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
			column_width = 1.0
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

}
