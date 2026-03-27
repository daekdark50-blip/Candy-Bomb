-- ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 140, 0, 90)
Main.Position = UDim2.new(0.5, -70, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 20, 147) -- РОЗОВЫЙ
Button.Text = "ШПИОН: МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ПОИСК ТЕХ САМЫХ 3-х МИН
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local found = 0

    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем только на чужих столах (расстояние больше 15 метров)
        if v:IsA("BasePart") and v.Size.X < 5 then
            local dist = (v.Position - root.Position).Magnitude
            if dist > 15 and dist < 120 then
                
                local isBad = false
                
                -- Проверка 1: Скрытые теги внутри конфеты
                for _, child in pairs(v:GetChildren()) do
                    local cn = child.Name:lower()
                    if cn:find("mine") or cn:find("bomb") or cn:find("bad") or cn:find("kill") then
                        isBad = true; break
                    end
                end
                
                -- Проверка 2: По прозрачности (иногда мины чуть прозрачнее)
                if not isBad and v.Transparency > 0 and v.Transparency < 1 then
                    isBad = true
                end

                -- Если это мина — КРАСИМ В РОЗОВЫЙ
                if isBad then
                    if not v:FindFirstChild("PinkSpy") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "PinkSpy"
                        h.FillColor = Color3.fromRGB(255, 0, 255)
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.8
                        found = found + 1
                    end
                end
            end
        end
    end
    Button.Text = "МИН: " .. found
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Close.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
