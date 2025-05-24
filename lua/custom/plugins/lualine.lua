return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			color0 = "#1a1b26",
			color1 = "#f7768e",
			color2 = "#9ece6a",
			color3 = "#24283b",
			color4 = "#c0caf5",
			color6 = "#565f89",
			color7 = "#7aa2f7",
			color8 = "#bb9af7",
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.color0, bg = colors.color7, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color3 },
				c = { fg = colors.color4, bg = colors.color3 },
			},
			insert = {
				a = { fg = colors.color0, bg = colors.color2, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color3 },
				c = { fg = colors.color4, bg = colors.color3 },
			},
			visual = {
				a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color3 },
				c = { fg = colors.color4, bg = colors.color3 },
			},
			replace = {
				a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color3 },
				c = { fg = colors.color4, bg = colors.color3 },
			},
			command = {
				a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color3 },
				c = { fg = colors.color4, bg = colors.color3 },
			},
			inactive = {
				a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
				b = { fg = colors.color6, bg = colors.color3 },
				c = { fg = colors.color6, bg = colors.color3 },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				--return "" .. str
				-- displays only the first character of the mode
				return ""
			end,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local lspstatus = function()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return "  LSP ~ None"
			end
			return "  LSP ~ "
				.. table.concat(
					vim.tbl_map(function(client)
						return client.name
					end, clients),
					", "
				)
		end

		local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = custom_theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { filename },
				lualine_x = { lspstatus },
				lualine_y = {
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "lspstatus" },
					{ "filetype" },
				},
			},
		})
	end,
}
