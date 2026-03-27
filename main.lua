-- [[ DARK HUB | CREATED BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV6") then CoreGui.DarkHubV6:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV6"
Gui.ResetOnSpawn = false

-- [[ КНОПКА ОТКРЫТИЯ [DH] ]] --
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.Text = "DH"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 450, 0, 320)
Main.Position = UDim2.new(0.5, -225, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- HEADER
local Head = Instance.new("Frame", Main)
Head.Size = UDim2.new(1, 0, 0, 40)
Head.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Instance.new("UICorner", Head)

local Title = Instance.new("TextLabel", Head)
Title.Size = UDim2.with(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "Dark Hub | Created by Dark By Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- SIDEBAR (ВКЛАДКИ)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 120, 1, -50)
Sidebar.Position = UDim2.new(0, 10, 0, 45)
Sidebar.BackgroundTransparency = 1
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 5)

-- CONTENT AREA
local Pages = Instance.new("Frame", Main)
Pages.Size = UDim2.new(1, -150, 1, -55)
Pages.Position = UDim2.new(0, 140, 0, 50)
Pages.BackgroundTransparency = 1

local function CreatePage(name)
    local p = Instance.new("ScrollingFrame", Pages)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(Pages:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local PageMain = CreatePage("MAIN")
local PageSpec = CreatePage("SPECTATE")
local PageScripts = CreatePage("SCRIPTS")

Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ФУНКЦИЯ ДЛЯ КНОПОК (ON/OFF)
local function AddToggle(txt, parent, func)
    local active = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(180, 180, 180)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = txt .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180)
        func(active)
    end)
end

-- [[ 1. РАЗДЕЛ MAIN ]] --
AddToggle("Full Invisible", PageMain, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

AddToggle("Wallhack (ESP)", PageMain, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then Instance.new("Highlight", p.Character).Name = "DH_ESP"
            else if p.Character:FindFirstChild("DH_ESP") then p.Character.DH_ESP:Destroy() end end
        end
    end
end)

AddToggle("Fly Mode", PageMain, function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
        
