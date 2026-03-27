-- 1. Полная очистка экрана от старых кнопок
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BlackSpyGui" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 160, 0, 90)
Main.Position = UDim2.new(0.5, -80, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "ВЗЛОМ СТОЛА (3 МИНЫ)"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ФУНКЦИЯ СКАНЕРА
Button.MouseButton1Click:Connect(function()
    local mines = 0
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    
    -- Ищем всё на уровне стола (высота Y от 3 до 8)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Position.Y > 3 and v.Position.Y < 8 then
            -- Проверяем дистанцию (чтобы не красить свой стол, только чужой)
            local dist = (v.Position - char.HumanoidRootPart.Position).Magnitude
            if dist > 10 and dist < 80 then
                
                -- ГЛАВНЫЙ ХАК: подсвечиваем всё, что имеет "начинку" (детали внутри плитки)
                -- В пустых синих плитках обычно ничего нет, а в минах — скрытые детали
                if #v:GetChildren() > 0 or v:IsA("MeshPart") then
                    if not v:FindFirstChild("BlackHighlight") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "BlackHighlight"
                        h.FillColor = Color3.fromRGB(0, 0, 0) -- Черный
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур
                        h.FillOpacity = 0.8
                        mines = mines + 1
                    end
                end
            end
        end
    end
    Button.Text = "НАШЕЛ: " .. mines
end)
