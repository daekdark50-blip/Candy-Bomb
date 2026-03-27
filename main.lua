-- [[ OMNI-X HUB V6 | CUSTOM PLACES EDITION ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Cleanup
if CoreGui:FindFirstChild("OmniHubV6") then CoreGui.OmniHubV6:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniHubV6"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ КНОПКА ПЛЮСИК [+] ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 100
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНАЯ ПАНЕЛЬ ]] --
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- [[ НАВИГАЦИЯ (ВКЛАДКИ) ]] --
local Nav = Instance.new("Frame")
Nav.Size = UDim2.new(1, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Nav.Parent = Main
Instance.new("UICorner", Nav)

local function CreateTabBtn(name, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.5, 0, 1, 0)
    b.Position = pos
    b.BackgroundTransparency = 1
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = Nav
    return b
end

local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0, 0, 0, 0))
local ScriptTabBtn = CreateTabBtn("SCRIPTS", UDim2.new(0.5, 0, 0, 0))

-- [[ КОНТЕЙНЕРЫ ]] --
local MainContent = Instance.new("ScrollingFrame")
MainContent.Size = UDim2.new(1, -20, 1, -50)
MainContent.Position = UDim2.new(0, 10, 0, 45)
MainContent.BackgroundTransparency = 1
MainContent.Visible = true
MainContent.CanvasSize = UDim2.new(0, 0, 0, 350)
MainContent.ScrollBarThickness = 0
MainContent.Parent = Main

local ScriptContent = Instance.new("ScrollingFrame")
ScriptContent.Size = MainContent.Size
ScriptContent.Position = MainContent.Position
ScriptContent.BackgroundTransparency = 1
ScriptContent.Visible = false
ScriptContent.CanvasSize = MainContent.CanvasSize
ScriptContent.ScrollBarThickness = 0
ScriptContent.Parent = Main

local function SetLayout(p)
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 6)
end
SetLayout(MainContent)
SetLayout(ScriptContent)

-- [[ ЛОГИКА ВКЛАДОК ]] --
Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

MainTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    ScriptContent.Visible = false
end)

ScriptTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    ScriptContent.Visible = true
end)

-- [[ ФУНКЦИЯ СОЗДАНИЯ КНОПОК ]] --
local function AddBtn(text, parent, callback)
    local active = false
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. ": [OFF]"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and ": [ON]" or ": [OFF]")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        callback(active)
    end)
end

-- [[ ВКЛАДКА: MAIN ]] --
AddBtn("Invisible Mode", MainContent, function(state)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = state and 0.5 or 0
            end
        end
    end
end)

AddBtn("ESP (Wallhack)", MainContent, function(state)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if state then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "ESP_Target"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            else
                if p.Character:FindFirstChild("ESP_Target") then p.Character.ESP_Target:Destroy() end
            end
        end
    end
end)

AddBtn("Spectate", MainContent, function(state)
    if state then
        local plrs = Players:GetPlayers()
        local t = plrs[math.random(1, #plrs)]
        if t and t.Character and t.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject = t.Character.Humanoid
        end
    else
        workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

-- [[ ВКЛАДКА: SCRIPTS (ПУСТО - ДЛЯ ТВОИХ СКРИПТОВ) ]] --

AddBtn("Place Script 1", ScriptContent, function(state)
    if state then
        -- Сюда вставь код для первого плейса
        print("Script for Place 1 is ON")
    else
        print("Script for Place 1 is OFF")
    end
end)

AddBtn("Reset Full UI", ScriptContent, function()
    Gui:Destroy()
end)
