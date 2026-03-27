-- СОЗДАЕМ СВОЁ МЕНЮ (БЕЗ ВНЕШНИХ БИБЛИОТЕК)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ESPButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Настройки GUI
ScreenGui.Name = "DarkCreatorUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ГЛАВНОЕ ОКНО (Маленькое и стильное)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -75, 0.5, -50)
MainFrame.Size = UDim2.new(0, 150, 0, 100) -- В 2 раза меньше!
MainFrame.Active = true
MainFrame.Draggable = true -- МОЖНО ДВИГАТЬ ПАЛЬЦЕМ!

-- ЗАГОЛОВОК
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "Dark Creator"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 14

-- КНОПКА ESP
ESPButton.Name = "ESPButton"
ESPButton.
