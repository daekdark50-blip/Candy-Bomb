-- УЛЬТРА-ПРОСТАЯ ВЕРСИЯ DARKHUB
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Size = UDim2.new(0, 200, 0, 250)
Main.Position = UDim2.new(0.5, -100, 0.2, 0)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.Text = "FLY FOR BRAINROTS"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1

local function Add(name, y)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.1, 0)
    btn.Position = UDim2.new(0.05, 0, y, 0)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    
    local act = false
    btn.MouseButton1Click:Connect(function()
        act = not act
        btn.BackgroundColor3 = act and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(40, 40, 40)
    end)
end

Add("Auto OG", 0.2)
Add("Auto Divine", 0.32)
Add("Collect Cash", 0.44)
Add("Upgrade All", 0.56)
Add("Buy Speed +10", 0.68)
Add("Auto Rebirth", 0.8)

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0.1, 0)
Footer.Position = UDim2.new(0, 0, 0.9, 0)
Footer.Text = "DarkHub"
Footer.TextColor3 = Color3.fromRGB(255, 0, 0)
Footer.BackgroundTransparency = 1
