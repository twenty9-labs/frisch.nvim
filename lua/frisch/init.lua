local M = {}

M.colors = require("frisch.colors")

function M.setup(opts)
  opts = opts or {}
  -- Future configuration options can be added here
end

function M.load(variant)
  require("frisch.theme").setup(variant)
end

return M
