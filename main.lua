-- ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 130, 0, 80)
Main.Position = UDim2.new(0.5, -65, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
Button.Text = "ПРОЯВИТЬ МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local count = 0

    -- Ищем всё в радиусе столов
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local dist = (v.Position - root.Position).Magnitude
            
            -- Если это чужой стол (от 15 до 70 метров)
            if dist > 15 and dist < 70 then
                -- ПРОВЕРКА: Ищем мелкие детали, которые обычно невидимы или спрятаны в модели
                if v.Size.X < 4 and v.Size.Z < 4 then
                    -- Если это не сама плитка (которую мы видим), а что-то внутри неё
                    if not v:FindFirstChild("FinalPink") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "FinalPink"
                        h.FillColor = Color3.fromRGB(255, 0, 255) -- РОЗОВЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.8
                        count = count + 1
                    end
                end
            end
        end
    end
    Button.Text = "НАЙДЕНО: "..count
end)
