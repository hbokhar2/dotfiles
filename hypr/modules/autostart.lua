return {

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

}
