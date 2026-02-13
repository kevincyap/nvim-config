local M = {}

function M.generateGUID()
  local handle = io.popen("powershell -Command (New-Guid).Guid")
  local guid = handle:read("*a")
  handle:close()
  return guid:gsub("%s+", "")
end

return M
