return {

	hl.workspace_rule({ workspace = "1", monitor = "DP-4", default = true, persistent = true }),
	hl.workspace_rule({ workspace = "2", monitor = "DP-4", persistent = true}),
	hl.workspace_rule({ workspace = "3", monitor = "DP-4", persistent = true }),

	hl.workspace_rule({ workspace = "4", monitor = "DP-3", default = true }),
	hl.workspace_rule({ workspace = "5", monitor = "DP-3", persistent = true}),
	hl.workspace_rule({ workspace = "6", monitor = "DP-3", persistent = true }),

}
