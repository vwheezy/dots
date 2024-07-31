local Plugin = { "mfussenegger/nvim-lint" }
Plugin.event = { "BufReadPre", "BufNewFile" }
Plugin.enabled = true

function Plugin.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		svelte = { "eslint_d" },
		python = { "pylint" },
	}

	local eslint = lint.linters.eslint_d
	eslint.args = {
		"--no-warn-ignored",
		"--format",
		"json",
		"--stdin",
		"--stdin-filename",
		function()
			return vim.api.nvim_buf_get_name(0)
		end,
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.keymap.set("n", "<leader>L", function()
		lint.try_lint(nil, { ignore_errors = true })
	end, { desc = "Trigger linting for current file" })
end

return Plugin
