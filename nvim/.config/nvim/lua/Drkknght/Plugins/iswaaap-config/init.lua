require("iswap").setup({
	-- the keys that will be used as a selection, in order
	-- ('asdfghjklqwertyuiopzxcvbnm' by default)
	keys = "asdfghjklmno",

	-- grey out the rest of the text when making a selection
	-- (enabled by default)
	grey = "disable",

	-- highlight group for the sniping value (asdf etc.)
	-- default 'search'
	hl_snipe = "HopNextKey",

	-- highlight group for the visual selection of terms
	-- default 'visual'
	hl_selection = "HopCursor",

	-- highlight group for the greyed background
	-- default 'comment'
	hl_grey = "linenr",

	-- highlight priority for the greyed background
	-- default '1000'
	hl_grey_priority = "200",

	-- automatically swap with only two arguments
	-- default nil
	autoswap = true,
})
