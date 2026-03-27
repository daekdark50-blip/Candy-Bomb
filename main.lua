-- УДАЛЯЕМ СТАРЫЕ МЕНЮ
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Size = UDim2.new(0, 140, 0, 90)
Main.Position = UDim2.new(0.5, -70, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- РОЗОВЫЙ
Button.Text = "РЕНТГЕН МИН"
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local found = 0

    -- Ищем вообще все детали на карте
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local dist = (v.Position - root.Position).Magnitude
            
            -- ПРОВЕРКА: Если это чужой стол (дистанция от 15 до 80 метров)
            if dist > 15 and dist < 80 then
                -- Если деталь маленькая (как конфета или мина)
                if v.Size.X < 5 and v.Size.Z < 5 then
                    -- Мы вешаем подсветку на ВСЁ мелкое на чужом столе
                    if not v:FindFirstChild("PinkXray") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "PinkXray"
                        h.FillColor = Color3.fromRGB(255, 0, 255) -- РОЗОВЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.8
                        found = found + 1
                    end
                end
            end
        end
    end
    Button.Text = "ВИЖУ: " .. found
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
