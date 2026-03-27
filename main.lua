-- [[ OMNI-X PRO | ENGLISH MOBILE EDITION ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Clean up
if CoreGui:FindFirstChild("OmniPro") then CoreGui.OmniPro:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniPro"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ TOGGLE BUTTON (PLUS) ]] --
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = Gui
OpenBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -20)
OpenBtn.Size = UDim2.new(0, 40, 0, 40)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Text = "+"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 30
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

-- [[ MAIN PANEL ]] --
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -125, 0.5, -140)
Main.Size = UDim2.new(0, 250, 0, 280)
Main.Visible = false
Main.Active = true
Main.Draggable = true -- Mobile friendly drag

local Corner = Instance.new("UICorner", Main)
