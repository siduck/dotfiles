" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
local package_path_str = "/home/sid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sid/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    after_files = { "/home/sid/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21compe-completion\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sid/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-auto-save"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sid/.local/share/nvim/site/pack/packer/opt/vim-auto-save"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sid/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/sid/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Conditional loads
time("Condition for { 'dashboard-nvim' }", true)
if
try_loadstring('\27LJ\2\nP\0\0\1\0\3\1\t6\0\0\0009\0\1\0009\0\2\0\b\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0"dashboard_disable_at_vimenter\6g\bvim\0\0', "condition", '{ "dashboard-nvim" }')
then
time("Condition for { 'dashboard-nvim' }", false)
time([[packadd for dashboard-nvim]], true)
		vim.cmd [[packadd dashboard-nvim]]
	time([[packadd for dashboard-nvim]], false)
else
time("Condition for { 'dashboard-nvim' }", false)
end
time("Condition for { 'vim-auto-save' }", true)
if
try_loadstring("\27LJ\2\n<\0\0\1\0\3\1\t6\0\0\0009\0\1\0009\0\2\0\b\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\14auto_save\6g\bvim\2\0", "condition", '{ "vim-auto-save" }')
then
time("Condition for { 'vim-auto-save' }", false)
time([[packadd for vim-auto-save]], true)
		vim.cmd [[packadd vim-auto-save]]
	time([[packadd for vim-auto-save]], false)
else
time("Condition for { 'vim-auto-save' }", false)
end
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-vsnip', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
