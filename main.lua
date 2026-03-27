-- ОЧИСТКА ЭКРАНА
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BrainrotFly" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BrainrotFly"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 200, 0, 200)
Main.Position = UDim2.new(0.5, -100, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(text, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.2, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- 1. АВТО-КЛИКЕР
local clicking = false
createBtn("АВТО-КЛИКЕР", UDim2.new(0.05, 0, 0.05, 0), Color3.fromRGB(50, 0, 0), function()
    clicking = not clicking
end)

-- 2. АВТО-СБОР (МОЗГИ)
local collecting = false
createBtn("СБОР МОЗГОВ", UDim2.new(0.05, 0, 0.3, 0), Color3.fromRGB(0, 50, 0), function()
    collecting = not collecting
end)

-- 3. ТЕЛЕПОРТ НА ФИНИШ
createBtn("ТП НА ФИНИШ", UDim2.new(0.05, 0, 0.55, 0), Color3.fromRGB(0, 0, 100), function()
    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
    -- Пытаемся найти самую дальнюю точку
    for i = 1, 100 do
        local target = workspace:FindFirstChild(tostring(i * 1000)) or workspace:FindFirstChild("Finish")
        if target then root.CFrame = target.CFrame end
    end
end)

-- 4. СКОРОСТЬ (SPEED)
createBtn("ULTRA SPEED", UDim2.new(0.05, 0, 0.8, 0), Color3.fromRGB(100, 100, 100), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 200
end)

-- ЛОГИКА
task.spawn(function()
    while task.wait(0.01) do
        if clicking then
            -- Пытаемся отправить сигнал клика на сервер
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Click") or game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FindFirstChild("Click")
            if event then event:FireServer() end
        end
        if collecting then
            -- Притягиваем все предметы с именами Brain или Gift
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name:find("Brain") or v.Name:find("Gift") then
                    if v:IsA("BasePart") then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
end)
