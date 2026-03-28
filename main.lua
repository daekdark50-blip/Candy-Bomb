-- [[ CANDY-BOMB HUB OFFICIAL LOADER ]] --
repeat task.wait() until game:IsLoaded()

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВОЙ_НИК/ТВОЙ_РЕПОЗИТОРИЙ/main/main.lua"))()
end)

if not success then
    warn("Ошибка загрузки Candy-Bomb: " .. tostring(err))
    -- Резервный запуск, если Гитхаб тупит
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Candy-Bomb Error",
        Text = "Проверь ссылку в лоадере!",
        Duration = 5
    })
end
