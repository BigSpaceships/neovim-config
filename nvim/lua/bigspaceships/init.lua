require("bigspaceships.packer")

if not pcall(vim.cmd, "colorscheme catppuccin-mocha") then
    vim.cmd("PackerSync")
end

require("bigspaceships.remap")
require("bigspaceships.set")
