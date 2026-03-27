-- 1. ЖЕСТКАЯ ОЧИСТКА ЭКРАНА
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
Main.Position = UDim2.new(0.5, -80, 0.1, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "ФИНАЛЬНЫЙ ВЗЛОМ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ФУНКЦИЯ "ТОТАЛЬНЫЙ СКАН"
Button.MouseButton1Click:Connect(function()
    local count = 0
    -- Сканируем ВООБЩЕ всё в игре (Workspace + папки)
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            -- Проверка высоты (уровень стола) и размера (конфета)
            if v.Position.Y > 3 and v.Position.Y < 10 and v.Size.X < 6 then
                -- Не красим себя
                if not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    if not v:FindFirstChild("FinalBlack") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "FinalBlack"
                        h.FillColor = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ КОНТУР
                        h.FillOpacity = 0.8
                        count = count + 1
                    end
                end
            end
        end
    end
    Button.Text = "ОБЪЕКТОВ: " .. count
end)
