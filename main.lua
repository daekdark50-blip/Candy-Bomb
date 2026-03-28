local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. ЛОАДЕР (DARK HUB STYLE) ]] --
local function RunLoading()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundColor3 = Color3.new(0,0,0)
    L.ZIndex = 10000
    
    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.4, 0)
    T.Text = "LOADING DARK HUB V42..."
    T.TextColor3 = Color3.new(1,0,0)
    T.Font = "GothamBold"
    T.TextSize = 50
    T.BackgroundTransparency = 1

    local B = Instance.new("Frame", L)
    B.Size = UDim2.new(0.5, 0, 0, 10)
    B.Position = UDim2.new(0.25, 0, 0.6, 0)
    B.BackgroundColor3 = Color3.fromRGB(30,30,30)
    
    local F = Instance.new("Frame", B)
    F.Size = UDim2.new(0, 0, 1, 0)
    F.BackgroundColor3 = Color3.new(1,0,0)
    
    F:TweenSize(UDim2.new(1,0,1,0), "Out", "Linear", 3)
    task.wait(3.2)
    T.Text = "WORK" --
    task.wait(1)
    L:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 550, 0, 400)
Main.Position = UDim2.new(0.5, -275, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UIListLayout", Side)

local Cont = Instance.new("Frame", Main)
Cont.Size = UDim2.new(1, -150, 1, -20)
Cont.Position = UDim2.new(0, 145, 0, 10)
Cont.BackgroundTransparency = 1

local function Tab(name)
    local f = Instance.new("ScrollingFrame", Cont)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.Visible = false
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 2
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25,25,25)
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Cont:GetChildren()) do v.Visible = false end
        f.Visible = true
    end)
    return f
end

local MTab = Tab("MAIN")
local STab = Tab("SCRIPTS")

-- [[ КНОПКИ ON/OFF ДЛЯ MAIN ]] --
local function AddToggle(parent, name, callback)
    local state = false
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Text = name .. " [ OFF ]"
    btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. (state and " [ ON ]" or " [ OFF ]")
        btn.BackgroundColor3 = state and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(30,30,30)
        callback(state)
    end)
end

-- ФЛИНГ / СПИН / БУСТ
AddToggle(MTab, "Fling Player", function(v) _G.Fling = v end)
AddToggle(MTab, "Spin Bot", function(v) _G.Spin = v end)
AddToggle(MTab, "Aimbot", function(v) _G.Aim = v end)

-- ВХ СЕКЦИЯ
AddToggle(MTab, "ESP Box", function(v) _G.EspBox = v end)
AddToggle(MTab, "ESP Avatar", function(v) _G.EspAvatar = v end)
AddToggle(MTab, "ESP Tracers", function(v) _G.EspTracers = v end)

-- СПИД БУСТ
AddToggle(MTab, "Speed Boost", function(v) lp.Character.Humanoid.WalkSpeed = v and 100 or 16 end)

-- ВИЗУАЛЫ
AddToggle(MTab, "Rainbow Skin", function(v) _G.Rainbow = v end)
AddToggle(MTab, "Click Fly", function(v) _G.CFly = v end)
AddToggle(MTab, "Always Day", function(v) game.Lighting.ClockTime = v and 12 or 14 end)

-- [[ СКРИПТЫ ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", STab)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(loadstring(game:HttpGet(u)))
end

AddS("Lucky Blocks Jump (Brainrot)", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddS("Escape Tsunami (Brainrot)", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddS("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddS("SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ КНОПКА ОТКРЫТИЯ ]] --
local Open = Instance.new("TextButton", Gui)
Open.Size = UDim2.new(0, 50, 0, 50)
Open.Position = UDim2.new(0, 10, 0.5, 0)
Open.Text = "DH"
Open.BackgroundColor3 = Color3.new(0,0,0)
Open.TextColor3 = Color3.new(1,0,0)
Instance.new("UICorner", Open).CornerRadius = UDim.new(1,0)
Open.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(RunLoading)
Main.Visible = true
MTab.Visible = true
