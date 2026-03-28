local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Удаление старой версии
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 🩸 УЛЬТРА-ЗАГРУЗКА ]] --
local function RunLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundColor3 = Color3.new(0, 0, 0)
    L.ZIndex = 10000

    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.4, 0)
    T.Text = "LOADING DARK HUB V42...\nBY AK ADMIN"
    T.TextColor3 = Color3.new(1, 0, 0)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 40
    T.BackgroundTransparency = 1

    local B = Instance.new("Frame", L)
    B.Size = UDim2.new(0.6, 0, 0, 12)
    B.Position = UDim2.new(0.2, 0, 0.6, 0)
    B.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    
    local F = Instance.new("Frame", B)
    F.Size = UDim2.new(0, 0, 1, 0)
    F.BackgroundColor3 = Color3.new(1, 0, 0)
    Instance.new("UICorner", F)

    TweenService:Create(F, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3.5)
    T.Text = "WORK"
    task.wait(1.5)
    L:Destroy()
end

-- [[ 🏢 ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 540, 0, 420)
Main.Position = UDim2.new(0.5, -270, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- КРЕСТ ЗАКРЫТИЯ
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 45, 0, 45)
Close.Position = UDim2.new(1, -50, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 30
Instance.new("UICorner", Close)
Close.MouseButton1Click:Connect(function() Gui:Destroy() end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.new(0, 0, 0)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 2)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -150, 1, -20)
Container.Position = UDim2.new(0, 145, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local MTab = CreateTab("MAIN")
local STab = CreateTab("SCRIPTS")

-- [[ 🛠️ ФУНКЦИИ В MAIN ]] --
local function AddToggle(n, cb)
    local state = false
    local b = Instance.new("TextButton", MTab)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Text = n .. " [ OFF ]"
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        state = not state
        b.Text = n .. (state and " [ ON ]" or " [ OFF ]")
        b.BackgroundColor3 = state and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(35, 35, 35)
        cb(state)
    end)
end

-- ТВОЙ СПИСОК ФУНКЦИЙ
AddToggle("Fling Player", function(v) end)
AddToggle("Spin Bot", function(v) end)
AddToggle("Aimbot", function(v) end)
AddToggle("ESP Box", function(v) end)
AddToggle("ESP Avatar", function(v) end)
AddToggle("ESP Tracer", function(v) end)
AddToggle("Speed Boost", function(v) lp.Character.Humanoid.WalkSpeed = v and 100 or 16 end)
AddToggle("Rainbow Skin", function(v) end)
AddToggle("Click Fly", function(v) end)
AddToggle("Day / Night", function(v) game.Lighting.ClockTime = v and 0 or 12 end)

-- [[ 📜 ВКЛАДКА SCRIPTS ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", STab)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(u))() end)
end

AddS("Dark Hub Loader", "https://raw.githubusercontent.com/Davidfhdgfyyfytyttry/DAVITROLLZ-BRASIL/refs/heads/main/loader%20trollz%20hub%20v2.lua.txt")
AddS("Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
AddS("Jump Steal (Brainrot)", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddS("Fly (Brainrot)", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- КНОПКА ОТКРЫТИЯ
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 55, 0, 55)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.BackgroundColor3 = Color3.new(0, 0, 0)
Tog.TextColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", Tog).Color = Color3.new(1, 0, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(RunLoader)
Main.Visible = true
MTab.Visible = true
