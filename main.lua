-- [[ OMNI-X V2.4 | ADVANCED SPECTATE ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Cleanup
if CoreGui:FindFirstChild("OmniV2") then CoreGui.OmniV2:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniV2"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ LOADING ]] --
local LFrame = Instance.new("Frame", Gui)
LFrame.Size = UDim2.new(1, 0, 1, 0)
LFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
LFrame.ZIndex = 500

local LText = Instance.new("TextLabel", LFrame)
LText.Size = UDim2.new(1, 0, 1, 0)
LText.Text = "LOADING SPECTATE SYSTEM..."
LText.TextColor3 = Color3.fromRGB(255, 0, 0)
LText.Font = Enum.Font.GothamBold
LText.TextSize = 25
LText.BackgroundTransparency = 1

task.wait(1.2)
LFrame:Destroy()

-- [[ TOGGLE BUTTON [+] ]] --
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 150
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ MAIN PANEL ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- [[ SPECTATE LIST PANEL (NEW) ]] --
local SpecFrame = Instance.new("Frame", Gui)
SpecFrame.Size = UDim2.new(0, 200, 0, 250)
SpecFrame.Position = UDim2.new(0.5, 130, 0.5, -125)
SpecFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpecFrame.Visible = false
SpecFrame.Active = true
SpecFrame.Draggable = true
Instance.new("UICorner", SpecFrame)

local SpecTitle = Instance.new("TextLabel", SpecFrame)
SpecTitle.Size = UDim2.new(1, 0, 0, 30)
SpecTitle.Text = "SELECT PLAYER"
SpecTitle.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
SpecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpecTitle.Font = Enum.Font.GothamBold
Instance.new("UICorner", SpecTitle)

local SpecScroll = Instance.new("ScrollingFrame", SpecFrame)
SpecScroll.Size = UDim2.new(1, -10, 1, -40)
SpecScroll.Position = UDim2.new(0, 5, 0, 35)
SpecScroll.BackgroundTransparency = 1
SpecScroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
SpecScroll.ScrollBarThickness = 2
Instance.new("UIListLayout", SpecScroll).Padding = UDim.new(0, 5)

-- [[ NAVIGATION ]] --
local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(1, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Instance.new("UICorner", Nav)

local function CreateTab(n, p)
    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(0.5, 0, 1, 0)
    b.Position = p
    b.BackgroundTransparency = 1
    b.Text = n
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    return b
end

local T1 = CreateTab("MAIN", UDim2.new(0,0,0,0))
local T2 = CreateTab("SCRIPTS", UDim2.new(0.5,0,0,0))

local C1 = Instance.new("ScrollingFrame", Main)
C1.Size = UDim2.new(1, -20, 1, -50)
C1.Position = UDim2.new(0, 10, 0, 45)
C1.BackgroundTransparency = 1
C1.ScrollBarThickness = 0
Instance.new("UIListLayout", C1).Padding = UDim.new(0, 5)

local C2 = Instance.new("ScrollingFrame", Main)
C2.Size = C1.Size
C2.Position = C1.Position
C2.BackgroundTransparency = 1
C2.Visible = false
C2.ScrollBarThickness = 0
Instance.new("UIListLayout", C2).Padding = UDim.new(0, 5)

T1.MouseButton1Click:Connect(function() C1.Visible = true C2.Visible = false end)
T2.MouseButton1Click:Connect(function() C1.Visible = false C2.Visible = true end)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    if not Main.Visible then SpecFrame.Visible = false end
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- [[ HELPER FUNCTIONS ]] --
local function AddToggle(text, parent, func)
    local active = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- Функция обновления списка игроков для Spectate
local function UpdateSpecList()
    for _, v in pairs(SpecScroll:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local btn = Instance.new("TextButton", SpecScroll)
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btn.Text = p.DisplayName or p.Name
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", btn)
            
            btn.MouseButton1Click:Connect(function()
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
                    SpecTitle.Text = "WATCHING: " .. p.Name
                end
            end)
        end
    end
end

-- [[ MAIN BUTTONS ]] --
AddToggle("Full Invisible", C1, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

AddToggle("Fly Mode", C1, function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if s then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "OmniFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while hrp:FindFirstChild("OmniFly") do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                task.wait()
            end
        end)
    else
        if hrp:FindFirstChild("OmniFly") then hrp.OmniFly:Destroy() end
    end
end)

AddToggle("Wallhack (ESP)", C1, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then Instance.new("Highlight", p.Character).Name = "ESP"
            else if p.Character:FindFirstChild("ESP") then p.Character.ESP:Destroy() end end
        end
    end
end)

-- НОВАЯ КНОПКА: ОТКРЫТЬ СПИСОК ИГРОКОВ ДЛЯ СЛЕЖ
