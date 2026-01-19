vim.pack.add({ 'https://github.com/folke/snacks.nvim' }, { confirm = false })
require('snacks').setup({
	bigfile = { enabled = true },
	-- dashboard = { enabled = true },
	explorer = { enabled = true },
	-- indent = { enabled = true },
	input = { enabled = true },
	-- notifier = {
	-- 	enabled = true,
	-- 	timeout = 3000,
	-- },
	quickfile = { enabled = true },
	rename = { enabled = true },
	scope = { enabled = true },
	scroll = {
		enabled = true,
		animate = {
			duration = { step = 6, total = 60 },
		},
		animate_repeat = {
			delay = 30,
			duration = { step = 3, total = 30 },
		},
	},
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
	-- toggle = { enabled = true },
	-- zen = { enabled = true },
	picker = {
		sources = {
			files = {
				hidden = false,
				ignored = false,
				win = {
					input = {
						keys = {
							['<S-h>'] = 'toggle_hidden',
							['<S-i>'] = 'toggle_ignored',
							['<S-f>'] = 'toggle_follow',
							['<C-y>'] = { 'yazi_copy_relative_path', mode = { 'n', 'i' } },
						},
					},
				},
				exclude = {
					'**/.git/*',
					'**/node_modules/*',
					'**/.yarn/cache/*',
					'**/.yarn/install*',
					'**/.yarn/releases/*',
					'**/.pnpm-store/*',
					'**/.idea/*',
					'**/.DS_Store',
					'build/*',
					'coverage/*',
					'dist/*',
					'hodor-types/*',
					'**/target/*',
					'**/public/*',
					'**/digest*.txt',
					'**/.node-gyp/**',
				},
			},
			grep = {
				hidden = false,
				ignored = false,
				win = {
					input = {
						keys = {
							['<S-h>'] = 'toggle_hidden',
							['<S-i>'] = 'toggle_ignored',
							['<S-f>'] = 'toggle_follow',
						},
					},
				},
				exclude = {
					'**/.git/*',
					'**/node_modules/*',
					'**/.yarn/cache/*',
					'**/.yarn/install*',
					'**/.yarn/releases/*',
					'**/.pnpm-store/*',
					'**/.venv/*',
					'**/.idea/*',
					'**/.DS_Store',
					'**/yarn.lock',
					'build*/*',
					'coverage/*',
					'dist/*',
					'certificates/*',
					'hodor-types/*',
					'**/target/*',
					'**/public/*',
					'**/digest*.txt',
					'**/.node-gyp/**',
				},
			},
			grep_buffers = {},
			explorer = {
				hidden = true,
				ignored = true,
				supports_live = true,
				auto_close = true,
				diagnostics = true,
				diagnostics_open = false,
				focus = 'list',
				follow_file = true,
				git_status = true,
				git_status_open = false,
				git_untracked = true,
				jump = { close = true },
				tree = true,
				watch = true,
				exclude = {
					'.git',
					'.pnpm-store',
					'.venv',
					'.DS_Store',
					'**/.node-gyp/**',
				},
			},
		},
	},
})
-- require('keymap.snacks')
