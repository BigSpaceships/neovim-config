vim.keymap.set("n", "<leader>gs", function()
	local paths = vim.fn.finddir(".git/..", vim.fn.expand('%:p:h') ..  ';')

	if paths ~= "" then
		vim.cmd.Git()
	else
		print("Not in a git repository")
	end
end)

local bigspaceships_fugitive = vim.api.nvim_create_augroup("bigspaceships_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = bigspaceships_fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = {buffer = bufnr, remap = false}

		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git('push')
		end, opts)

		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git('pull', '--rebase')
		end, opts)

		vim.keymap.set("n", "<leader>gc", ":Git commit -m \"", opts);

		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
		-- TODO: make this so I can set a branch to push to and save it between sessions
	end,
})
