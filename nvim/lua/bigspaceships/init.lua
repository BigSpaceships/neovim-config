require("bigspaceships.packer")

if not pcall(require, "tokyonight") then
    fullMode = false
else
    fullMode = true
    require("bigspaceships.remap")
    require("bigspaceships.set")
end

require("tokyonight").setup({
    transparent = true
})

vim.cmd("colorscheme tokyonight")

require("bigspaceships.remap")
require("bigspaceships.set")
