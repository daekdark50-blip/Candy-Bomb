-- ЧИСТКА
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == "UltraAncientGui" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "UltraAncientGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Size = UDim2.new(0, 200, 0, 140)
Main.Position = UDim2.new(0.5, -100, 0.1, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(text, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.4, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- КНОПКА: ТЕЛЕПОРТ В САМЫЙ КОНЕЦ (К АНТИЧНЫМ)
createBtn("TP TO FAR ANCIENT", UDim2.new(0.05, 0, 0.1, 0), Color3.fromRGB(150, 0, 255), function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    
    local target = nil
    local maxDist = 0

    -- Сканируем всё дерево игры
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local name = v.Name:lower()
            -- Ищем упоминание Ancient или просто самую дальнюю точку (обычно это в конце трассы)
            if name:find("ancient") or name:find("mythic") or name:find("secret") then
                local dist = (v.Position - Vector3.new(0,0,0)).Magnitude
                if dist > maxDist then
                    maxDist = dist
                    target = v
                end
            end
        end
    end

    if target then
        root.CFrame = target.CFrame + Vector3.new(0, 5, 0)
    else
        -- Если по имени не на
            
