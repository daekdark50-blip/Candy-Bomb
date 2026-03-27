-- [[ OMNI-X PRO V5 | DUAL WINDOWS ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Cleanup
if CoreGui:FindFirstChild("OmniProV5") then CoreGui.OmniProV5:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniProV5"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ TOGGLE BUTTON (+) ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.
