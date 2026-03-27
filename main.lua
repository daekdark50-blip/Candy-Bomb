-- GEMINI CANDY-BOMB HUB
local p = game.Players.LocalPlayer
local function notify(t) 
    game.StarterGui:SetCore("SendNotification", {Title="GEMINI HUB", Text=t, Duration=5}) 
end

notify("ЗАГРУЗКА... ПОДГОТОВКА ВХ")

-- 1. СКОРОСТЬ И ПРЫЖОК
p.Character.Humanoid.WalkSpeed = 100
p.Character.Humanoid.JumpPower = 150
p.Character.Humanoid.UseJumpPower = true

-- 2. ВХ НА КОНФЕТЫ
function applyWH()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and (v.Name:lower():find("candy") or v.Name:lower():find("bomb")) then
            if not v:FindFirstChild("GeminiESP") then
                local h = Instance.new("Highlight", v)
                h.Name = "GeminiESP"
                h.FillColor = Color3.new(1, 0, 0) -- Красный цвет (бомба)
                h.FillOpacity = 0.5
            end
        end
    end
end

-- Цикл обновления (чтобы ВХ не пропадало)
task.spawn(function()
    while task.wait(3) do pcall(applyWH) end
end)

notify("ВСЁ ВКЛЮЧЕНО! ТЫ КОРОЛЬ СТОЛА")
