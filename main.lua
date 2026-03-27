-- ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 130, 0, 80)
Main.Position = UDim2.new(0.5, -65, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- РОЗОВЫЙ
Button.Text = "НАЙТИ 3 МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ФУНКЦИЯ ПОИСКА ПЛОХИХ КОНФЕТ
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local minesFound = 0

    for _, v in pairs(workspace:GetDescendants()) do
        -- Сканируем мелкие объекты на чужих столах (дальше 15м)
        if v:IsA("BasePart") and v.Size.X < 5 then
            local dist = (v.Position - root.Position).Magnitude
            if dist > 15 and dist < 80 then
                
                -- ГЛАВНАЯ ПРОВЕРКА: ищем ЛЮБУЮ скрытую метку
                local isDangerous = false
                
                -- 1. Скрытые атрибуты (самое частое)
                for attribName, _ in pairs(v:GetAttributes()) do
                    if attribName:lower():find("danger") or attribName:lower():find("mine") then isDangerous = true; break; end
                end
                
                -- 2. Скрытые объекты внутри
                if not isDangerous then
                    for _, child in pairs(v:GetChildren()) do
                        if child:IsA("BoolValue") or child:IsA("StringValue") then
                           local cn = child.Name:lower()
                           if cn:find("danger") or cn:find("mine") or cn:find("trap") then isDangerous = true; break; end
                        end
                    end
                end

                -- Если нашли скрытую метку — КРАСИМ В РОЗОВЫЙ
                if isDangerous then
                    if not v:FindFirstChild("PinkMineAlert") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "PinkMineAlert"
                        h.FillColor = Color3.fromRGB(255, 0, 255) -- Розовый
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        minesFound = minesFound + 1
                    end
                end
            end
        end
    end
    Button.Text = "МИНЫ: " .. minesFound
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Close.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
