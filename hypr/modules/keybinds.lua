local M = {}

function M.setup(vars)

	local mainMod = "SUPER"

	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(" CTRL + ALT + DELETE ", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
	hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(vars.terminal))
	hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
	hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(vars.menu))
	hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(vars.audioControl))
	hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(vars.calculator))
	hl.bind(mainMod .. " + C", hl.dsp.window.center())
	hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
	hl.bind(mainMod .. " + V", hl.dsp.window.float())

	hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "left"}))
	hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "right"}))
	hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "up"}))
	hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "down"}))
	hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({direction = "left"}))
	hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({direction = "right"}))
	hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({direction = "up"}))
	hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({direction = "down"}))

	hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
	hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

	hl.bind(mainMod .. " + Page_Up",   hl.dsp.focus({ workspace = "m-1" }))
	hl.bind(mainMod .. " + Page_Down", hl.dsp.focus({ workspace = "m+1" }))
	for i = 1, 6 do
		hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i}))
		hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i}))
	end
end

return M
