-- ПОЛНАЯ ЧИСТКА (убираем все старые меню)
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BlackSpyGui" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Main.Size = UDim2.new(0, 160, 0, 90)
Main.Position = UDim2.new(0.5, -80, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "ВЗЛОМ: 3 МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local minesCount = 0
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")

    -- Сканируем всё в мире
    for _, v in pairs(workspace:GetDescendants()) do
        -- 1. Только детали или меши
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            local dist = (v.Position - root.Position).Magnitude
            -- 2. Высота стола (Y от 3 до 10) и дистанция (чужой стол)
            if v.Position.Y > 3 and v.Position.Y < 10 and dist > 10 and dist < 100 then
                -- 3. ХАКЕРСКИЙ ФИЛЬТР: подсвечиваем, если есть ЛЮБОЕ скрытое свойство или аттрибут
                -- Обычные синие плитки "пустые", а в минах есть либо значения, либо скрипты
                local isSus = #v:GetChildren() > 0 or v:FindFirstChildOfClass("Configuration") or v:GetAttributes()["Mine"]
                    
