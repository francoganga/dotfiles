local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

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

    local filtered_dirs = {
        "git",
        "node",
        "vendor",
        "var",
    }

    -- vim.fn.jobstart({"find", ".", "-type", "d", "|", "grep", "-vE", "git"}, {
        vim.fn.jobstart({"find", ".", "-type", "d"}, {
            stdout_buffered = true,
            on_stdout = function (_, data)

                local d = data

                local filtered = {}

                --FILTER git?
                for i, dir in ipairs(d) do
                    if dir ~= "." then
                        table.insert(filtered, dir)
                    end
                end

                for i, dir in ipairs(filtered_dirs) do
                    table.filter(filtered, function(e)
                        return string.find(e, dir) == nil
                    end)
                end

                pickers.new(opts, {
                    prompt_title = "Directories",
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

return M
