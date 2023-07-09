--require("json")
if fullMode then    
    vim.keymap.set("n", "<leader>gs", function()
        local paths = vim.fn.finddir(".git/..", vim.fn.expand('%:p:h') ..  ';')

    	if paths ~= "" then
            vim.cmd.Git()
        else
            print("Not in a git repository")
        end
    end)

    local bigspaceships_fugitive = vim.api.nvim_create_augroup("bigspaceships_fugitive", {})

    -- local function read_config_file_safe()
    --     local cfg_dir = vim.fn.stdpath('cache') .. "/git_config/"
    -- 
    --     if not vim.fn.isdirectory(cfg_dir) then
    --         vim.fn.mkdir(cfg_dir)
    --     end
    -- 
    --     local file = io.input(cfg_dir .. "origins.txt", "w")
    -- 
    --     local lines = {}
    -- 
    --     for line in file:lines() do
    --         print(line)
    --     end
    -- 
    --     file:close()
    -- end

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
        group = bigspaceships_fugitive,
        pattern = "*",
        callback = function()
            if vim.bo.ft ~= "fugitive" then
                return
            end
    --        read_config_file_safe()

            local bufnr = vim.api.nvim_get_current_buf()
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "<leader>p", function()
                vim.cmd.Git('push')
            end, opts)

            vim.keymap.set("n", "<leader>P", function()
                vim.cmd [[ Git pull --rebase ]]
            end, opts)

            vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            -- TODO: make this so I can set a branch to push to and save it between sessions
        end,
    })
end
