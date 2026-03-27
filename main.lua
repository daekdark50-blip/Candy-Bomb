-- ПОЛНАЯ ОЧИСТКА ГЛЮКОВ
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Черный фон меню
Main.Size = UDim2.new(0, 150, 0, 90)
Main.Position = UDim2.new(0.5, -75, 0.2, 0) -- По центру
Main.Active = true
Main.Draggable = true -- Двигать пальцем
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- КРУТОЙ ЧЕРНЫЙ ЦВЕТ КНОПКИ
Button.Text = "ВКЛЮЧИТЬ ЧЕРНЫЙ ВХ"
Button.TextColor3 = Color3.new(1, 1, 1) -- Белый текст
Button.Font = Enum.Font.GothamBold -- Крутой шрифт
Button.TextSize = 14
Instance.new("UICorner", Button)

-- ФУНКЦИЯ "ЧЕРНЫЙ РЕНТГЕН"
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local minesCount = 0

    -- Ищем по всей карте
    for _, v in pairs(workspace:GetDescendants()) do
        -- Проверяем: мелкий объект, на чужом столе (дальше 15м)
        if v:IsA("BasePart") and v.Size.X < 5 then
            local dist = (v.Position - root.Position).Magnitude
            if dist > 15 and dist < 100 then
                
                -- ГЛАВНАЯ ПРОВЕРКА: Если это невидимая деталь внутри модели (так прячут мины)
                if not v:FindFirstChild("BlackHighlight") then
                    local h = Instance.new("Highlight", v)
                    h.Name = "BlackHighlight"
                    h.FillColor = Color3.fromRGB(0, 0, 0) -- КРУТОЙ ЧЕРНЫЙ ГЛЯНЕЦ
                    h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур, чтобы видеть в темноте
                    h.FillOpacity = 0.9 -- Почти не прозрачный
                    h.OutlineOpacity = 0.6
                    minesCount = minesCount + 1
                end
            end
        end
    end
    
    Button.Text = "НАШЕЛ: " .. minesCount
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 22, 0, 22)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0) -- Круглая
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
