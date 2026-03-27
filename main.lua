-- [[ OMNI-X HUB: ПРЯМОЙ ЗАПУСК ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Очистка старых меню
if CoreGui:FindFirstChild("SimpleHub") then CoreGui.SimpleHub:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "SimpleHub"
Gui.Parent = CoreGui

-- ГЛАВНОЕ ОКНО (Мрачное)
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Черный
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(200, 0, 0) -- Красная обводка
Main.Position = UDim2.new(0.5, -125, 0.5, -150)
Main.Size = UDim2.new(0, 250, 0, 300)
Main.Active = true
Main.Draggable = true -- Можно двигать на телефоне

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = Main

-- ЗАГОЛОВОК
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Text = "OMNI-X | ТЕЛЕФОН"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14

-- СПИСОК КНОПОК
local List = Instance.new("ScrollingFrame")
List.Parent = Main
List.Position = UDim2.new(0, 10, 0, 45)
List.Size = UDim2.new(1, -20, 1, -55)
List.Background
