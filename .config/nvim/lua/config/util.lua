--- Contains reusable utility functions
-- @module util
-- @alias M
local M={}-- custom utils

--- A function to serialize a table
-- @param tbl (table) The table to be converted.
-- @param opts (table|nil)
--   - newline: (string) Default: '\n'
--   - indent: (string) Default: '\n'
-- @return: Returns a string representation of the table.
function M.tableToString(tbl, opts)
  -- Check if the input is a table
  if type(tbl) ~= "table" then
      error("Input is not a table.")
  end

  -- Default options
  local opts=opts or {}
  opts.newline = opts.newline or "\n"
  opts.indent = opts.indent or "  "

  -- Helper function to recursively convert a table into a string
  local function convertTableToString(tbl, indent, newline, depth)
    local result = "{" .. newline
    -- Get all the keys in the table
    local keys = {}
    for key in pairs(tbl) do
      table.insert(keys, key)
    end
    -- Sort the keys for consistent output
    table.sort(keys)

    depth = depth or 0
		if depth == 0 then
			indent = ''
			vim.notify('indent = "'..indent..'"', vim.log.levels.INFO)
		end
		for _=1, depth do
			indent = indent..indent
		end
		vim.notify('indent = "'..indent..'"', vim.log.levels.INFO)

    -- Convert each key-value pair into a string
    for _, key in ipairs(keys) do
      local value = tbl[key]
      local valueType = type(value)

      -- Convert the key and value into strings
      local keyString = tostring(key)
      local valueString = tostring(key)

      if valueType == "table" then
        -- Recursively convert nested tables
        valueString = convertTableToString(value, indent, newline, depth+1)
      else
        valueString = tostring(value)
      end

      -- Add the key-value pair to the result string
      result = result .. indent .. "[" .. keyString .. "] = " .. valueString .. "," .. newline
    end
    -- Add closing bracket
    return result .. indent .. '}'
  end

  -- Call the helper function to convert the table into a string
  return convertTableToString(tbl, opts.indent, opts.newline)
end

return M
