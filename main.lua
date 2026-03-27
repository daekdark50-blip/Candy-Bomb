-- УДАЛЯЕМ СТАРЬЕ, ЕСЛИ ЕСТЬ
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "ToraHubCopy" or v.Name == "DarkHubBrainrot") then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkHubBrainrot"

-- ГЛАВНОЕ ОКНО (КОПИРУЕМ РАЗМЕР И ЦВЕТ СО СКРИНШОТА)
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Очень темно-серый, почти черный
Main.Size = UDim2.new(0, 190, 0, 240) -- Компактный размер, как на скрине
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 5) -- Слегка скругленные углы

local function createToggle(name, pos, callback)
    local Label = Instance.new("TextLabel", Main)
    Label.Size = UDim2.new(0.75, 0, 0.12, 0) -- Ширина для текста
    Label.Position = pos
    Label.Text = name
    Label.TextColor3 = Color3.new(1, 1, 1) -- Белый текст
    Label.Font = Enum.Font.GothamBold -- Жирный шрифт
    Label.TextXAlignment = Enum.TextXAlignment.Left -- Выравнивание по левому краю
    Label.BackgroundTransparency = 1 -- Прозрачный фон
    Label.TextSize = 12
    
