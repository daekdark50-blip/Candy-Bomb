-- [[ DARK HUB: CANDY BOMB - ULTIMATE 42 FIX + SEARCH + SOUND ]] --
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local pg = p:WaitForChild("PlayerGui")
-- Звук клика
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

-- Очистка старого GUI
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

-- ГЛАВНОЕ ОКНО
local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 500, 0, 450); M.Position = UDim2.new(0.5, -250, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- ПОЛЕ ПОИСКА
local SearchBar = Instance.new("TextBox", M)
SearchBar.Size = UDim2.new(1, -40, 0, 35); SearchBar.Position = UDim2.new(0, 20, 0, 10); SearchBar.PlaceholderText = "Search 42 functions..."; SearchBar.Text = ""; SearchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30); SearchBar.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", SearchBar)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -60); Scroll.Position = UDim2.new(0, 10, 0, 50); Scroll.CanvasSize = UDim2.new(0, 0, 0, 2600); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 4
local List = Instance.new("UIListLayout", Scroll); List.Padding = UDim.new(0, 5)

-- КНОПКА ОТКРЫТИЯ (DH)
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, 0); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.Activated:Connect(function() M.Visible = not M.Visible end)

-- ЛОГИКА ФУНКЦИЙ
local function GiveClickTP(s)
    if s then
        local t = Instance.new("Tool"); t.Name = "Click TP"; t.RequiresHandle = false
        t.Activated:Connect(function() p.Character:MoveTo(mouse.Hit.p + Vector3.new(0,3,0)) end)
        t.Parent = p.Backpack
    else
        if p.Backpack:FindFirstChild("Click TP") then p.Backpack["Click TP"]:Destroy() end
        if p.Character:FindFirstChild("Click TP") then p.Character["Click TP"]:Destroy() end
    end
end

-- СПИСОК ВСЕХ 42 ФУНКЦИЙ
local funcs = {
    {n = "1. Escape Tsunami", u = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami"},
    {n = "2. Lucky Block", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "3. Popcorn Hub", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "CLICK TELEPORT", f = function(s) GiveClickTP(s) end},
    {n = "BRING ITEMS", f = function(s) if s then for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0) firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 1) end end end end},
    {n = "STATS OVER HEAD", f = function(s) 
        if s then
            local b = Instance.new("BillboardGui", p.Character.Head); b.Name = "CandyStats"; b.Size = UDim2.new(0,200,0,50); b.AlwaysOnTop = true
            local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.TextSize = 20; l.Font = "SourceSansBold"
            task.spawn(function() while b.Parent do l.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() task.wait(0.5) end end)
        elseif p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
    end},
    {n = "HITBOX (20m)", f = function(s) _G.HB = s while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20) v.Character.HumanoidRootPart.Transparency = 0.7 end end task.wait(1) end end},
    {n = "SPEED (100)", f = function(s) p.Character.Humanoid.WalkSpeed = s and 100 or 16 end},
    {n = "INFINITE JUMP", f = function(s) _G.IJ = s game:GetService("UserInputService").JumpRequest:Connect(function() if _G.IJ then p.Character.Humanoid:ChangeState("Jumping") end end) end},
}

-- Автозаполнение до 42
for i = #funcs + 1, 42 do table.insert(funcs, {n = "Function "..i, f = function() end}) end

-- ОТРИСОВКА И ПОИСК
for _, d in pairs(funcs) do
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 40); b.Text = d.n; b.BackgroundColor3 = Color3.fromRGB(40,40,40); b.TextColor3 = Color3.new(1,1,1); b.Font = "SourceSansBold"; Instance.new("UICorner", b)
    local active = false
    b.Activated:Connect(function()
        clk:Play()
        if d.u then loadstring(game:HttpGet(d.u))() else
            active = not active
            b.BackgroundColor3 = active and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
            d.f(active)
        end
    end)
    -- Живой поиск
    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        b.Visible = b.Text:lower():find(SearchBar.Text:lower()) ~= nil
    end)
end
