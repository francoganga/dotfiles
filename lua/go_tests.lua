local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

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

function table.filter(t, predicate)
  local i = 1
  while i <= #t do
    if not predicate(t[i]) then
      table.remove(t, i)
    else
      i = i + 1
    end
  end
  return t
end

M.fuzzy_dirs= function (opts)
    opts = opts or {}

    -- vim.fn.jobstart({"find", ".", "-type", "d", "|", "grep", "-vE", "git"}, {
        vim.fn.jobstart({"find", ".", "-type", "d"}, {
            stdout_buffered = true,
            on_stdout = function (_, data)


                local d = data

                local filtered = {}

                --FILTER git?
                for i, dir in ipairs(d) do
                    if dir == "." then
                    else if string.find(dir, "git") == nil then
                        table.insert(filtered, dir)
                    end
                end

                table.filter(filtered, function(e)
                    return string.find(e, "node") == nil
                end)

                table.filter(filtered, function(e)
                    return string.find(e, "vendor") == nil
                end)

                table.filter(filtered, function(e)
                    return string.find(e, "var") == nil
                end)
            end


            pickers.new(opts, {
                prompt_title = "colors",
                finder = finders.new_table {
                    results = filtered
                },
                sorter = conf.generic_sorter(opts),

                attach_mappings = function(prompt_bufnr, map)
                    actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        vim.cmd(string.format("silent edit %s", selection[1]))
                    end)
                    return true
                end,

            }):find()
        end
    })
end

M.goimports = function()

    local bufnr = vim.api.nvim_get_current_buf()
    local file_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local cid = vim.fn.jobstart({"goimports"}, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            if data ~= "" then
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

-- gets current window pos as [row, col]
--vim.fn.win_screenpos(vim.api.nvim_get_current_win())

-- gets list of windows
--vim.api.nvim_list_wins

return M
