require("bigspaceships.packer")

if not pcall(vim.cmd, "colorscheme catppuccin-mocha") then
    fullMode = false
    --vim.cmd("PackerSync")
else 
    fullMode = true
    require("bigspaceships.remap")
    require("bigspaceships.set")
end
