-- ПОЛНАЯ ЗАЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 150, 0, 90)
Main.Position = UDim2.new(0.5, -75, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
Button.Text = "ВКЛЮЧИТЬ РОЗОВЫЙ ВХ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local found = 0
    -- Сканируем ВООБЩЕ ВЕСЬ Workspace без исключений
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            -- Проверяем только размер (конфеты и мины всегда маленькие)
            -- Убираем проверку на дистанцию, чтобы ловило везде
            if v.Size.X < 5 and v.Size.Z < 5 and v.Size.Y < 5 then
                -- Игнорируем только твоего персонажа, чтобы ты сам не светился
                if not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    if not v:FindFirstChild("FinalPinkESP") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "FinalPinkESP"
                        h.FillColor = Color3.fromRGB(255, 0, 255) -- Тот самый розовый
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.7
                        found = found + 1
                    end
                end
            end
        end
    end
    Button.Text = "ОБЪЕКТОВ: " .. found
end)
