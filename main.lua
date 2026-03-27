-- ПОЛНАЯ ЧИСТКА СТАРОГО МУСОРА
for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
    if gui:IsA("ScreenGui") and (gui.Name == "BlackSpyGui" or gui:FindFirstChild("Main")) then
        gui:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Main.Size = UDim2.new(0, 160, 0, 100)
Main.Position = UDim2.new(0.5, -80, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.7, 0)
Button.Position = UDim2.new(0.05, 0, 0.15, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "ВКЛЮЧИТЬ ЧЕРНЫЙ ВХ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local found = 0
    -- Сканируем всё на высоте стола (выше пола)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Position.Y > 3 and v.Position.Y < 10 then
            -- Ищем объекты, которые находятся внутри столов противников (дистанция)
            local dist = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if dist > 10 and dist < 100 then
                -- Если это не простая пустая плитка (имеет узор, меш или другие вложения)
                if #v:GetChildren() > 0 or v:IsA("MeshPart") then
                    if not v:FindFirstChild("GhostBlack") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "GhostBlack"
                        h.FillColor = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ КОНТУР
                        h.FillOpacity = 0.8
                        found = found + 1
                    end
                end
            end
        end
    end
    Button.Text = "ВИЖУ ЦЕЛЕЙ: " .. found
end)
