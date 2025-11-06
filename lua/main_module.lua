local main_module = {}

function main_module.test()
    print("Test function called 1from main_module")
end

function main_module.generateGUID()
    local handle = io.popen("powershell -Command (New-Guid).Guid")
    local guid = handle:read("*a")
    handle:close()
    return guid:gsub("%s+", "")  -- Remove any whitespace
end

return main_module

