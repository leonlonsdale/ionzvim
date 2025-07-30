local common_opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	for k, v in pairs(common_opts) do
		if opts[k] == nil then
			opts[k] = v
		end
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- mirror some helix bindings
-- copy / paste to / from system clipboard
map("n", "<leader>Y", '"+y', { noremap = true, silent = true })
map("v", "<leader>Y", '"+y', { noremap = true, silent = true })
map("n", "<leader>P", '"+p', { noremap = true, silent = true })
map("v", "<leader>P", '"+p', { noremap = true, silent = true })
-- comments
map("n", "<leader>c", "gcc", { remap = true, desc = "Toggle line comment" })
map("v", "<leader>c", "gc", { remap = true, desc = "Toggle line comment (visual)" })
map("n", "<leader>C", "gbc", { remap = true, desc = "Toggle block comment" })
map("v", "<leader>C", "gb", { remap = true, desc = "Toggle block comment (visual)" })
-- go to end/start of line with gl
map("n", "gl", "$", { noremap = true, desc = "Go to end of line" })
map("n", "gs", "^", { noremap = true, desc = "Go to start of line" })

-- navigation edits
-- Remap j and k to gj and gk in normal and visual mode
map("n", "j", "gj", { desc = "Move down visually" })
map("n", "k", "gk", { desc = "Move up visually" })
map("v", "j", "gj", { desc = "Move down visually" })
map("v", "k", "gk", { desc = "Move up visually" })

-- Remap Up and Down to gk and gj
map("n", "<Up>", "gk", { desc = "Move up visually" })
map("n", "<Down>", "gj", { desc = "Move down visually" })
map("v", "<Up>", "gk", { desc = "Move up visually" })
map("v", "<Down>", "gj", { desc = "Move down visually" })

-- Move lines up and down
map("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("x", "<S-Up>", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })
map("x", "<S-Down>", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })

-- Indentation

map("v", ">", ">gv", { desc = "Indent block to the right and keep selected" })
map("v", "<", "<gv", { desc = "Indent block to the left and keep selected" })

-- buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Switch to the next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Switch to the previous buffer" })
map("n", "<leader>bx", ":bdelete<CR>", { desc = "Close the current buffer" })
map("n", "<leader>bd", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except the current one" })

-- Navigate panes
map("n", "<C-h>", "<C-w>h", { desc = "Move to the pane on the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the pane below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the pane above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the pane on the right" })

-- Snacks
local Snacks = require("snacks")
map("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })
map("n", "<leader>snd", function()
	Snacks.toggle.dim()
end, { desc = "Toggle dim" })

-- live preview
-- map("n", "<leader>ls", function()
-- 	sennvim.utilities.toggle_live_preview()
-- end, { desc = "Toggle LivePreview" })

-- Picker
-- map("n", "<leader>ee", ":lua MiniFiles.open()<CR>", { desc = "Togglu MiniFiles" })
map("n", "<leader>ee", "<cmd>Yazi<cr>", { desc = "Yazi" })

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>fx", function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find nvim config files " })

-- lsp

local M = {}

M.lsp = function(bufnr)
	map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
	map("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover info", buffer = bufnr })
	map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
	map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show references", buffer = bufnr })
	map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
	map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
	map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code", buffer = bufnr })
	map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open diagnostic", buffer = bufnr })
end
return M
