-- [[ DARK HUB CANDY BOMB: FINAL EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

-- ОСНОВНОЕ ОКНО
local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 550, 0, 500); M.Position = UDim2.new(0.5, -275, 0.5, -250); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- ЗАГОЛОВОК И ПОИСК
local T = Instance.new("TextLabel", M); T.Size = UDim2.new(1, 0, 0, 40); T.Text = "Dark Hub Candy Bomb"; T.TextColor3 = Color3.new(1, 0, 0); T.Font = "SourceSansBold"; T.TextSize = 24; T.BackgroundTransparency = 1
local S = Instance.new("TextBox", M); S.Size = UDim2.new(1, -40, 0, 35); S.Position = UDim2.new(0, 20, 0, 45); S.PlaceholderText = "Поиск функций..."; S.Text = ""; S.BackgroundColor3 = Color3.fromRGB(30, 30, 30); S.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", S)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -100); Scroll.Position = UDim2.new(0, 10, 0, 90); Scroll.CanvasSize = UDim2.new(0, 0, 0, 4500); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 6
local Layout = Instance.new("UIListLayout", Scroll); Layout.Padding = UDim.new(0, 5)

-- КНОПКА ОТКРЫТИЯ (DH)
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 20, 0.4, 0); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Tog.TextSize = 30; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

-- СПИСОК ВСЕХ 42 ФУНКЦИЙ
local funcs = {
    {n = "1. Escape Tsunami", type = "s", u = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami"},
    {n = "2. Lucky Block", type = "s", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "3. Popcorn Hub", type = "s", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "4. Infinite Yield", type = "s", u = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {n = "11. SimpleSpy V3", type = "s", u = "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua"},
    
    {n = "STATS ABOVE HEAD", type = "t", f = function(on)
        if on then
            local b = Instance.new("BillboardGui", p.Character.Head); b.Name = "CandyStats"; b.Size = UDim2.new(0,200,0,50); b.AlwaysOnTop = true; b.ExtentsOffset = Vector3.new(0,3,0)
            local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.Font = "SourceSansBold"; l.TextSize = 22
            task.spawn(function() while b.Parent do l.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
        elseif p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
    end},
    {n = "HITBOX (20m)", type = "t", f = function(on) _G.HB = on; while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20); v.Character.HumanoidRootPart.Transparency = 0.7 end end; task.wait(1) end end},
    {n = "SPEED (100)", type = "t", f = function(on) p.Character.Humanoid.WalkSpeed = on and 100 or 16 end},
    {n = "HIGH JUMP", type = "t", f = function(on) p.Character.Humanoid.JumpPower = on and 150 or 50 end},
    {n = "FLY MOBILE", type = "t", f = function(on) if on then loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Fly"))() end end},
    {n = "FULLBRIGHT", type = "t", f = function(on) game:GetService("Lighting").Brightness = on and 2 or 1 end},
    {n = "FOV 120", type = "t", f = function(on) workspace.CurrentCamera.FieldOfView = on and 120 or 70 end},
    {n = "RESET", type = "t", f = function() p.Character:BreakJoints() end},
}

-- ГЕНЕРАЦИЯ КНОПОК
for i = 1, 42 do
    local data = funcs[i] or {n = "Function "..i, type = "t", f = function() end}
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = data.n .. (data.type == "t" and ": OFF" or "")
    b.BackgroundColor3 = data.type == "s" and Color3.fromRGB(40,40,40) or Color3.fromRGB(0, 50, 100)
    b.TextColor3 = Color3.new(1,1,1); b.Font = "SourceSansBold"; Instance.new("UICorner", b)
    
    local state = false
    b.MouseButton1Click:Connect(function()
        clk:Play()
        if data.type == "s" then loadstring(game:HttpGet(data.u))() 
        else
            state = not state
            b.Text = data.n .. ": " .. (state and "ON" or "OFF")
            b.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(0, 50, 100)
            data.f(state)
        end
    end)
    
    -- ЛОГИКА ПОИСКА
    S:GetPropertyChangedSignal("
        
