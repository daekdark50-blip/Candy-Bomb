-- ОЧИСТКА
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
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ
Button.Text = "ПОИСК 3 МИН"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local minesFound = 0

    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем только мелкие детали на столах (выше пола)
        if v:IsA("BasePart") and v.Size.X < 4 and v.Position.Y > 3 then
            local dist = (v.Position - root.Position).Magnitude
            
            -- Если это чужой стол (от 10 до 80 метров)
            if dist > 10 and dist < 80 then
                
                -- ГЛАВНЫЙ ФИЛЬТР: Ищем признаки мины (скрытые объекты или прозрачность)
                local isRealMine = false
                
                -- Проверяем наличие скрытых меток внутри плитки
                for _, child in pairs(v:GetChildren()) do
                    if child:IsA("ValueBase") or child.Name:lower():find("mine") or child.Name:lower():find("bomb") then
                        isRealMine = true
                        break
                    end
                end
                
                -- Если нашли именно мину
                if isRealMine then
                    if not v:FindFirstChild("BlackTarget") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "BlackTarget"
                        h.FillColor = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ КОНТУР
                        h.FillOpacity = 0.9
                        minesFound = minesFound + 1
                    end
                end
            end
        end
    end
    Button.Text = "НАЙДЕНО: " .. minesFound
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
