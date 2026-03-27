-- [[ OMNI-X STABLE MOBILE ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старой версии, чтобы не копились
if CoreGui:FindFirstChild("OmniMobile") then
    CoreGui.OmniMobile:Destroy()
end

-- Основной GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniMobile"
Gui.Parent = CoreGui
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ КНОПКА ОТКРЫТИЯ (ПЛЮСИК) ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.Name = "ToggleButton"
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Position = UDim2.new(0, 10, 0.4, 0)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 30
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 100

local ToggleCorner = Instance.new("UICorner", Toggle)
ToggleCorner.CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Name = "MainFrame"
Main.Visible = false
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -110, 0.5, -130)
Main.Size = UDim2.new(0, 220, 0, 260)
Main.Draggable = true -- Можно двигать пальцем
Main.Active = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 10)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Text = "OMNI-X PRO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Instance.new("UICorner", Title)

-- Список кнопок
local List = Instance.new("ScrollingFrame")
List.Parent = Main
List.Position = UDim2.new(0, 10, 0, 50)
List.Size = UDim2.new(1, -20,
  
