local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension("vim_bookmarks")

vim.api.nvim_set_keymap("n", "<Leader>ma", ":Telescope vim_bookmarks all<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>mc",
	":Telescope vim_bookmarks current_file<CR>",
	{ noremap = true, silent = true }
)
