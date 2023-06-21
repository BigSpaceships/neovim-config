require("bigspaceships.packer")

if not pcall(vim.cmd, "colorscheme kanagawa-dragon") then
    vim.cmd("PackerSync")
end

require("bigspaceships.remap")
require("bigspaceships.set")
