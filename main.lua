-- [[ DARK HUB | BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV5") then CoreGui.DarkHubV5:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "DarkHubV5"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ КНОПКА DH ]] --
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Position = UDim2.new(0, 10, 0.5, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.Text = "DH"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ОСНОВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 400, 0, 280)
Main.Position = UDim2.new(0.5, -200, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Заголовок
local Head = Instance.new("Frame", Main)
Head.Size = UDim2.new(1, 0, 0, 35)
Head.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", Head)

local Title = Instance.new("TextLabel", Head)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "Dark Hub | Created by Dark By Hub"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Боковая панель
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 110, 1, -45)
Sidebar.Position = UDim2.new(0, 5, 0, 40)
Sidebar.BackgroundTransparency = 1
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 5)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -125, 1, -45)
Content.Position = UDim2.new(0, 120, 0, 40)
Content.BackgroundTransparency = 1

local function CreatePage(name)
    local p = Instance.new("ScrollingFrame", Content)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(Content:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local PageMain = CreatePage("Main")
local PageFarm = CreatePage("Brainrots") -- Та самая вкладка со скринов

Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Дизайн к
