DEBUG_MAPPINGS = {
	--debugger
	{ "<leader>x", group = "debugger" },
	{ "<leader>xx", ":lua require('dapui').toggle()<cr>", desc = "toggle dap ui " },
	{ "<leader>xc", ":lua require('dap').continue()<cr>", desc = "continue dap " },
	{ "<leader>xb", ":lua require('dap').toggle_breakpoint()<cr>", desc = "toggle breakpoint" },
	{ "<leader>xr", ":lua require('dap').open({reset = true})<cr>", desc = "reset dap" },
	{ "<leader>xs", ":lua require('dap').repl.open()<cr>", desc = "open repl" },
	{ "<leader>xo", ":lua require('dap').step_over()<cr>", desc = "step over" },
	{ "<leader>xi", ":lua require('dap').step_into()<cr>", desc = "step into" },
	{ "<leader>xa", ":lua require('dap').step_out()<cr>", desc = "step outside" },
}

return DEBUG_MAPPINGS
