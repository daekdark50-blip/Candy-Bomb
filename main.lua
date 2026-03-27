-- УДАЛЯЕМ СТАРОЕ МЕНЮ ЕСЛИ ОНО БЫЛО
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

ScreenGui.Name = "DarkCreatorGui"
ScreenGui.Parent = game:GetService("CoreGui")

-- ОКНО (Маленькое и стильное)
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Position = UDim2.new(0.5, -60, 0.4, 0)
Main.Size = UDim2.new(0, 130, 0, 80) -- Совсем крошечное
Main.Active = true
Main.Draggable = true -- МОЖНО ДВИГАТЬ ПАЛЬЦЕМ

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

-- ЗАГОЛОВОК
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Text = "Dark Creator"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold

-- КНОПКА ВКЛЮЧЕНИЯ
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.Position = UDim2.new(0.1, 0, 0.4, 0)
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Text = "Яркий ESP"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 12
Instance.new("UICorner", Button)

-- КНОПКА ЗАКРЫТЬ
Close.Parent = Main
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Size = UDim2.new(0, 15, 0, 15)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)

-- ФУНКЦИЯ ESP
Button.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and (v.Name:lower():find("candy") or v.Name:lower():find("bomb")) then
            local h = Instance.new("Highlight", v)
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.OutlineColor = Color3.fromRGB(255, 255, 255)
        end
    end
    Button.Text = "АКТИВНО!"
end)

Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
