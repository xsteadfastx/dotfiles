-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/marv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Colorizer = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/Colorizer",
    url = "https://github.com/chrisbra/Colorizer"
  },
  ["Comment.nvim"] = {
    config = { 'require("config/comment")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/marv/.local/share/nvim/site/pack/packer/opt/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["csv.vim"] = {
    config = { 'require("config/csv")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  dirsettings = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/dirsettings",
    url = "https://github.com/chazy/dirsettings"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["fidget.nvim"] = {
    config = { 'require("config/fidget")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { 'require("config/formatter")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    config = { 'require("config/fzf-lua")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/marv/.local/share/nvim/site/pack/packer/opt/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gist-vim"] = {
    config = { 'require("config/gist")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/gist-vim",
    url = "https://github.com/mattn/gist-vim"
  },
  ["git-blame.nvim"] = {
    config = { 'require("config/git-blame")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("config/gitsigns")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gotests-vim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/gotests-vim",
    url = "https://github.com/buoto/gotests-vim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("config/indent-blankline")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lualine.nvim"] = {
    config = { 'require("config/lualine")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { 'require("config/neoscroll")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-cmp"] = {
    config = { 'require("config/nvim-cmp")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cursorline"] = {
    config = { 'require("config/nvim-cursorline")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    after = { "fzf-lua" },
    loaded = true,
    only_config = true
  },
  ["nvim-lint"] = {
    config = { 'require("config/nvim-lint")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config/nvim-lspconfig")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config/nvim-treesitter")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { 'require("config/nvim-treesitter-context")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["scrollbar.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/marv/.local/share/nvim/site/pack/packer/opt/scrollbar.nvim",
    url = "https://github.com/Xuyuanp/scrollbar.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { 'require("config/todo-comments")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'require("config/trouble")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/unicode.vim",
    url = "https://github.com/chrisbra/unicode.vim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-bracketed-paste"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-bracketed-paste",
    url = "https://github.com/ConradIrwin/vim-bracketed-paste"
  },
  ["vim-pencil"] = {
    config = { 'require("config/pencil")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-pencil",
    url = "https://github.com/reedes/vim-pencil"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  vimux = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux"
  },
  vimwiki = {
    config = { 'require("config/vimwiki")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { 'require("config/which-key")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("config/zen-mode")' },
    loaded = true,
    path = "/home/marv/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: barbar.nvim
time([[Setup for barbar.nvim]], true)
require("config/topbar")
time([[Setup for barbar.nvim]], false)
time([[packadd for barbar.nvim]], true)
vim.cmd [[packadd barbar.nvim]]
time([[packadd for barbar.nvim]], false)
-- Setup for: scrollbar.nvim
time([[Setup for scrollbar.nvim]], true)
require("config/scrollbar")
time([[Setup for scrollbar.nvim]], false)
time([[packadd for scrollbar.nvim]], true)
vim.cmd [[packadd scrollbar.nvim]]
time([[packadd for scrollbar.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require("config/todo-comments")
time([[Config for todo-comments.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("config/comment")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
require("config/nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require("config/trouble")
time([[Config for trouble.nvim]], false)
-- Config for: csv.vim
time([[Config for csv.vim]], true)
require("config/csv")
time([[Config for csv.vim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("config/indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
require("config/nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config/nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("config/which-key")
time([[Config for which-key.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
require("config/vimwiki")
time([[Config for vimwiki]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("config/lualine")
time([[Config for lualine.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
require("config/fidget")
time([[Config for fidget.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require("config/formatter")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-lint
time([[Config for nvim-lint]], true)
require("config/nvim-lint")
time([[Config for nvim-lint]], false)
-- Config for: vim-pencil
time([[Config for vim-pencil]], true)
require("config/pencil")
time([[Config for vim-pencil]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
require("config/git-blame")
time([[Config for git-blame.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("config/zen-mode")
time([[Config for zen-mode.nvim]], false)
-- Config for: gist-vim
time([[Config for gist-vim]], true)
require("config/gist")
time([[Config for gist-vim]], false)
-- Config for: nvim-dap-go
time([[Config for nvim-dap-go]], true)
require("config/dap-go")
time([[Config for nvim-dap-go]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require("config/neoscroll")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config/nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("config/gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config/nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd fzf-lua ]]

-- Config for: fzf-lua
require("config/fzf-lua")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
