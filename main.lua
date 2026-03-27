local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Dark creator Candy esp", "DarkTheme")

local ESPTab = Window:NewTab("Candy ESP")
local ESPSection = ESPTab:NewSection("Visuals")

local function applyESP()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name:lower():find("candy") or obj.Name:lower():find("bomb")) then
            if not obj:FindFirstChild("DarkESP") then
                local h = Instance.new("Highlight", obj)
                h.Name = "DarkESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.FillOpacity = 0.5
            end
        end
    end
end

ESPSection:NewButton("Включить ESP", "Подсветить конфеты", function()
    applyESP()
    task.spawn(function()
        while task.wait(3) do applyESP() end
    end)
end)

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("UI")

SettingsSection:NewButton("Удалить Меню", "Закрыть чит", function()
    game:GetService("CoreGui"):FindFirstChild("Dark creator Candy esp"):Destroy()
end)

game.StarterGui:SetCore("SendNotification", {Title="Dark Creator", Text="Скрипт готов!", Duration=5})
