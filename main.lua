-- [[ CANDY-BOMB FINAL LOADER ]] --
repeat task.wait() until game:IsLoaded()

-- СЮДА ВСТАВЛЯЙ ССЫЛКУ, КОТОРУЮ СКОПИРОВАЛ ПОСЛЕ НАЖАТИЯ "RAW"
local my_url = "ТВОЯ_ССЫЛКА_ЗДЕСЬ" 

local success, result = pcall(function()
    return loadstring(game:HttpGet(my_url))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Ошибка Candy-Bomb",
        Text = "Неверная ссылка! Проверь RAW на GitHub.",
        Duration = 15
    })
    warn("LOG ERROR: " .. tostring(result))
end
