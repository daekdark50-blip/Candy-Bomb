-- DARKHUB V10: FINAL STABLE (TORA STYLE)
repeat task.wait() until game:IsLoaded()

local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RS = game:GetService("ReplicatedStorage")

if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 200, 0, 310)
Main.Position = UDim2.new(0.5, -100, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Flags = {ancient=false, og=false, divine=false, cash=false, upg=false, speed=false, reb=false}
local BasePos = nil
local IsFarming = false

-- Поиск папки эвентов
local Events = RS:FindFirstChild("Events") or RS:FindFirstChild("Remotes") or RS

local function AddToggle(name, y, key)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0.9, 0, 0, 28)
    Btn.Position = UDim2.new(0.05, 0, 0, y)
    Btn
    
