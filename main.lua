-- ОЧИСТКА ЭКРАНА
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == "ClownStealerGui" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "ClownStealerGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 200, 0, 180)
Main.Position = UDim2.new(0.5, -100, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(name, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.25, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- 1. ТЕЛЕПОРТ К КЛОУНУ
createBtn("ЗАБРАТЬ КЛОУНА", UDim2.new(0.05, 0, 0.05, 0), Color3.fromRGB(150, 0, 0), function()
    local clowns = workspace:FindFirstChild("Clowns") or workspace:FindFirstChild("Pickups")
    if clowns then
        local target = clowns:FindFirstChildWhichIsA("BasePart") or clowns:FindFirstChildWhichIsA("Model")
        if target then
            local pos = target:IsA("Model") and target:GetModelCFrame() or target.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end
    end
end)

-- 2. ТЕЛЕПОРТ НА БАЗУ
createBtn("ДОМОЙ (БАЗА)", UDim2.new(0.05, 0, 0.35, 0), Color3.fromRGB(0, 100, 200), function()
    local spawnPoint = game.Players.LocalPlayer.RespawnLocation
    if spawnPoint then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawnPoint.CFrame + Vector3.new(0, 3, 0)
    end
end)

-- 3. СКОРОСТЬ + ПРЫЖОК
createBtn("ULTRA SPEED", UDim2.new(0.05, 0, 0.65, 0), Color3.fromRGB(50, 50, 50), function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.WalkSpeed = 100
    hum.JumpPower = 100
end)
