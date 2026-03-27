-- DARKHUB V3: TORAHUB ENGINE CLONE
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 190, 0, 280)
Main.Position = UDim2.new(0.5, -95, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Flags = {ancient=false, og=false, divine=false, cash=false, upg=false, speed=false, reb=false}
local BasePos = nil

local function CreateToggle(name, y, key)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0.9, 0, 0.1, 0)
    Btn.Position = UDim2.new(0.05, 0, y, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = name
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 11
    Instance.new("UICorner", Btn)

    Btn.MouseButton1Click:Connect(function()
        Flags[key] = not Flags[key]
        Btn.BackgroundColor3 = Flags[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(30, 30, 30)
        if Flags[key] then BasePos = Root.CFrame end
    end)
end

-- Кнопки
CreateToggle("AUTO ANCIENT", 0.08, "ancient")
CreateToggle("AUTO OG", 0.20, "og")
CreateToggle("AUTO DIVINE", 0.32, "divine")
CreateToggle("COLLECT CASH", 0.44, "cash")
CreateToggle("UPGRADE ALL", 0.56, "upg")
CreateToggle("BUY SPEED +10", 0.68, "speed")
CreateToggle("AUTO REBIRTH", 0.80, "reb")

-- ГЛАВНЫЙ ФАРМ-ДВИЖОК
task.spawn(function()
    while task.wait(0.01) do -- Скорость как у Торы
        pcall(function()
                    
