-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/richiemugambi/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/richiemugambi/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/richiemugambi/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/richiemugambi/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/richiemugambi/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n½\1\0\2\a\0\b\0\0146\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0019\2\5\0+\3\2\0=\3\6\0029\2\5\0+\3\2\0=\3\a\2K\0\1\0\31documentFormattingProvider\23definitionProvider\24server_capabilities\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimû\5\1\0\n\0-\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0029\2\4\0009\2\5\0025\4\6\0=\1\a\0043\5\b\0=\5\t\4B\2\2\0016\2\0\0'\4\n\0B\2\2\0029\3\5\0025\5\r\0004\6\3\0005\a\v\0>\a\1\0065\a\f\0>\a\2\6=\6\14\0055\6\17\0009\a\15\0029\a\16\aB\a\1\2=\a\18\0069\a\15\0029\a\19\aB\a\1\2=\a\20\0069\a\15\0029\a\21\a5\t\22\0B\a\2\2=\a\23\6=\6\15\5B\3\2\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6\28\0006\a\24\0009\a\29\a9\a\30\a9\a\31\a5\b \0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6!\0006\a\24\0009\a\29\a9\a\30\a9\a\"\a5\b#\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6$\0006\a\24\0009\a\29\a9\a\30\a9\a%\a5\b&\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6'\0006\a\24\0009\a\29\a9\a\30\a9\a(\a5\b)\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6*\0006\a\24\0009\a\29\a9\a\30\a9\a+\a5\b,\0B\3\5\1K\0\1\0\1\0\1\vbuffer\2\vrename\15<leader>rn\1\0\1\vbuffer\2\16code_action\15<leader>ca\1\0\1\vbuffer\2\nhover\6K\1\0\1\vbuffer\2\15references\agr\1\0\1\vbuffer\2\15definition\bbuf\blsp\agd\6n\bset\vkeymap\bvim\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\rcomplete\fmapping\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\bcmp\14on_attach\0\17capabilities\1\0\0\nsetup\rtsserver\25default_capabilities\17cmp_nvim_lsp\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/richiemugambi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n½\1\0\2\a\0\b\0\0146\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0019\2\5\0+\3\2\0=\3\6\0029\2\5\0+\3\2\0=\3\a\2K\0\1\0\31documentFormattingProvider\23definitionProvider\24server_capabilities\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimû\5\1\0\n\0-\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0029\2\4\0009\2\5\0025\4\6\0=\1\a\0043\5\b\0=\5\t\4B\2\2\0016\2\0\0'\4\n\0B\2\2\0029\3\5\0025\5\r\0004\6\3\0005\a\v\0>\a\1\0065\a\f\0>\a\2\6=\6\14\0055\6\17\0009\a\15\0029\a\16\aB\a\1\2=\a\18\0069\a\15\0029\a\19\aB\a\1\2=\a\20\0069\a\15\0029\a\21\a5\t\22\0B\a\2\2=\a\23\6=\6\15\5B\3\2\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6\28\0006\a\24\0009\a\29\a9\a\30\a9\a\31\a5\b \0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6!\0006\a\24\0009\a\29\a9\a\30\a9\a\"\a5\b#\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6$\0006\a\24\0009\a\29\a9\a\30\a9\a%\a5\b&\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6'\0006\a\24\0009\a\29\a9\a\30\a9\a(\a5\b)\0B\3\5\0016\3\24\0009\3\25\0039\3\26\3'\5\27\0'\6*\0006\a\24\0009\a\29\a9\a\30\a9\a+\a5\b,\0B\3\5\1K\0\1\0\1\0\1\vbuffer\2\vrename\15<leader>rn\1\0\1\vbuffer\2\16code_action\15<leader>ca\1\0\1\vbuffer\2\nhover\6K\1\0\1\vbuffer\2\15references\agr\1\0\1\vbuffer\2\15definition\bbuf\blsp\agd\6n\bset\vkeymap\bvim\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\rcomplete\fmapping\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\bcmp\14on_attach\0\17capabilities\1\0\0\nsetup\rtsserver\25default_capabilities\17cmp_nvim_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
