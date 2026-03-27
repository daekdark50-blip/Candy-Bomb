-- 1. УДАЛЯЕМ ВСЕ СТАРЫЕ КНОПКИ (Чтобы не мешались)
for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
    if gui:IsA("ScreenGui") and (gui.Name == "BlackSpyGui" or gui:FindFirstChild("Main")) then
        gui:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Глубокий черный
Main.Size = UDim2.new(0, 150, 0, 90)
Main.Position = UDim2.new(0.5, -75, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "НАЙТИ 3 МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ФУНКЦИЯ ПОИСКА
Button.MouseButton1Click:Connect(function()
    local minesFound = 0
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем только мелкие детали на столах (выше уровня пола)
        if v:IsA("BasePart") and v.Size.X < 5 and v.Position.Y > 3 then
            -- Проверяем на наличие скрытых данных (Values) внутри конфеты
            local isMine = false
            for _, child in pairs(v:GetChildren()) do
                if child:IsA("ValueBase") or child.Name:lower():find("mine") then
                    isMine = true; break
                end
            end
            
            if isMine and not v:FindFirstChild("BlackESP") then
                local h = Instance.new("Highlight", v)
                h.Name = "BlackESP"
                h.FillColor = Color3.fromRGB(0, 0, 0) -- Черный цвет мины
                h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур
                h.FillOpacity = 0.8
                minesFound = minesFound + 1
            end
        end
    end
    Button.Text = "МИНЫ: " .. minesFound
end)
