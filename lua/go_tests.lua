local lsp_utils = R('lspconfig/util')

local uv = vim.loop

local M = {}

-- local function filter_dirs(dirs, filters or {})
--     for i, dir in ipairs(dirs) do
--         if dir == "." then
--         end
--         for _, filter in ipairs(filters) do
--             if string.find(dir, )
--         end
--     end
-- end



M.goimports = function()

    local bufnr = vim.api.nvim_get_current_buf()
    local file_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local cid = vim.fn.jobstart({"goimports"}, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            if #data > 1 then
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
            end
        end
    })

    if not cid then
        print("Error: No job")
        return
    end

    vim.fn.chansend(cid, file_content)
    vim.fn.chanclose(cid, "stdin")
    vim.fn.jobwait({cid}, 1000)
end

M.prettier_svelte = function()

    local bufnr = vim.api.nvim_get_current_buf()
    local file_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    --cat src/App.svelte | npx prettier --stdin-filepath App.svelte --plugin prettier-plugin-svelte --config .prettierrc
    local cwd = vim.fn.expand("%:p:h")
    P(cwd)


    local package_json_path = lsp_utils.find_package_json_ancestor(cwd)

    if package_json_path == nil then
        print("Error: No package.json found")
        return
    end

    local config_file_location = package_json_path .. "/.prettierrc.js"

    local cmd = {
        "bun",
        "x",
        "prettier",
        "--stdin-filepath",
        "file.svelte",
        "--plugin",
        "prettier-plugin-svelte",
        "--config",
        config_file_location
    }
    P(cmd)

    local cid = vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            if #data > 1 then
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
            end
        end,
        on_stderr = function (_, err)
            if #err > 1 then
                P(err)
            end
        end
    })

    if not cid then
        print("Error: No job")
        return
    end

    vim.fn.chansend(cid, file_content)
    vim.fn.chanclose(cid, "stdin")
    vim.fn.jobwait({cid}, 1000)

end

M.djlint = function()

    local bufnr = vim.api.nvim_get_current_buf()
    local file_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local cid = vim.fn.jobstart({"djlint", "-", "--reformat"}, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            if #data > 1 then
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
            end
        end,
        on_stderr = function (_, err)
            if #err > 1 then
                P(err)
            end
        end
    })

    vim.fn.chansend(cid, file_content)
    vim.fn.chanclose(cid, "stdin")
    vim.fn.jobwait({cid}, 1000)

end

-- gets current window pos as [row, col]
--vim.fn.win_screenpos(vim.api.nvim_get_current_win())

-- gets list of windows
--vim.api.nvim_list_wins

return M
