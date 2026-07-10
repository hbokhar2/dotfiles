return {

	hl.window_rule({
		name  = "suppress-maximize-events",
		match = { class = ".*" },
		suppress_event = "maximize",
	}),

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
	}),

	hl.window_rule({
		name = "pavucontrol-float",
		match = {class = "^(org.pulseaudio.pavucontrol)$"},
		size = {600, 675},
		move = {
			"min(max(cursor_x - 300, 0), monitor_w - 600)",
			"min(max(cursor_y - 337, 48), monitor_h - 675)"
		},
		float = true,
	}),

	hl.window_rule({
		name = "qalculate-float",
		match = {class = "^(qalculate-gtk)$"},
		move = {
			"min(max(cursor_x - 350, 0), monitor_w - 700)",
			"min(max(cursor_y - 350, 48), monitor_h - 700)"
		},
		size = {700, 700},
		float = true,
	}),

	hl.window_rule ({
		name = "performance-fullscreen",
		match = {fullscreen = true},
		no_blur = true,
	}),

	hl.window_rule({
		name = "keepass-browser-popup-float",
		match = {
			class = "^(org.keepassxc.KeePassXC)$",
			title = "^(KeePassXC - Browser Access Request)$",
		},
		float = true,
	}),

}
