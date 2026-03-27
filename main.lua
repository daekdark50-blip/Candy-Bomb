-- DARKHUB FIXED VERSION
local Player = game:GetService("Players").LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Удаляем старое, если оно зависло
if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 190, 0, 240)
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.Text = "FLY FOR BRAINROTS"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.TextSize = 13

-- Переменные для работы
local Settings = {og=false, divine=false, cash=false, upg=false, speed=false, reb=false}

local function AddToggle
    
