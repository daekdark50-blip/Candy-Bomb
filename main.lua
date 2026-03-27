local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/steven9031/SolarisLib/main/source.lua"))()

-- СОЗДАЕМ МАЛЕНЬКОЕ ОКНО (Оно в 2 раза меньше обычного)
local Win = SolarisLib:New({
  Name = "Dark Creator",
  FolderToSave = "DarkStuff"
})

-- ВКЛАДКА
local Tab = Win:Tab("Candy ESP")

-- КНОПКА ВКЛЮЧЕНИЯ (Яркая и четкая)
Tab:Button("Включить Яркий ESP", function()
    SolarisLib:Notification("Dark Creator", "ESP Активирован! Ищи конфеты.")
    
    -- Цикл поиска конфет
    task.spawn(function()
        while true do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and (v.Name:lower():find("candy") or v.Name:lower():find("bomb")) then
                    if not v:FindFirstChild("BrightHighlight") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "BrightHighlight"
                        h.FillColor = Color3.fromRGB(255, 0, 50) -- Ярко-красный
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур (чтобы сияло)
                        h.FillOpacity = 0.5
                    end
                end
            end
            task.wait(3) -- Проверка каждые 3 секунды
        end
    end)
end)

-- КНОПКА ЗАКРЫТИЯ МЕНЮ
Tab:Button("ЗАКРЫТЬ МЕНЮ", function()
    game:GetService("CoreGui"):FindFirstChild("SolarisLib"):Destroy()
end)

-- ИНСТРУКЦИЯ: Чтобы двигать меню, просто зажми верхнюю панель пальцем!
