-- [[ CANDY-BOMB OFFICIAL WORKING LOADER ]] --
repeat task.wait() until game:IsLoaded()

-- Твоя ссылка на GitHub с обходом кэша
local url = "https://raw.githubusercontent.com/daekdark50-blip/Candy-Bomb/main/main.lua?nocache="..tick()

local success, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    warn("Ошибка загрузки: " .. tostring(err))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Candy-Bomb Error",
        Text = "Проверь код в main.lua на GitHub!",
        Duration = 10
    })
end
