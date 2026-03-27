-- ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkCreatorGui"
ScreenGui.Parent = game:GetService("CoreGui")

-- МИНИ ОКНО
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0.5, -60, 0.2, 0)
Main.Size = UDim2.new(0, 130, 0, 80)
Main.Active = true
Main.Draggable = true -- МОЖНО ДВИГАТЬ

local Corner = Instance.new("UICorner", Main)

-- КНОПКА
local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Position = UDim2.new(0.1, 0, 0.35, 0)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.Text = "ВКЛЮЧИТЬ ESP"
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button)

-- ФУНКЦИЯ
Button.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local n = v.Name:lower()
            if n:find("candy") or n:find("bomb") or n:find("mine") or n:find("diamond") or n:find("gift") then
                local h = Instance.new("Highlight", v)
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end
    Button.Text = "РАБОТАЕТ!"
end)

-- КНОПКА ЗАКРЫТЬ
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.8, 5, -0.1, 0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Close.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
