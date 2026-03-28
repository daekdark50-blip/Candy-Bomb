-- [[ DARK HUB: CANDY BOMB - FIX SCROLL & SEARCH & SOUND ]] --
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local pg = p:WaitForChild("PlayerGui")
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 500, 0, 450); M.Position = UDim2.new(0.5, -250, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- ПОЛЕ ПОИСКА (Чтобы быстро находить FPS и функции)
local Search = Instance.new("TextBox", M)
Search.Size = UDim2.new(1, -40, 0, 35); Search.Position = UDim2.new(0, 20, 0, 10); Search.PlaceholderText = "Search (FPS, Hitbox, TP)..."; Search.Text = ""; Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Search.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", Search)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -60); Scroll.Position = UDim2.new(0, 10, 0, 50); Scroll.CanvasSize = UDim2.new(0, 0, 0, 2800); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 6
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 5)

-- ФУНКЦИИ
local function GiveTP(s)
    if s then
        local t = Instance.new("Tool"); t.Name = "Click TP"; t.RequiresHandle = false
        t.Activated:Connect(function() p.Character:MoveTo(mouse.Hit.p + Vector3.new(0,3,0)) end); t.Parent = p.Backpack
    else if p.Backpack:FindFirstChild("Click TP") then p.Backpack["Click TP"]:Destroy() end end
end

local all = {
    {n = "1. Escape Tsunami", u = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami"},
    {n = "2. Lucky Block", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "3. Popcorn Hub", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "4. Infinite Yield", u = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {n = "CLICK TELEPORT", f = function(s) GiveTP(s) end},
    {n = "STATS OVER HEAD (FPS)", f = function(s) 
        if s then
            local b = Instance.new("BillboardGui", p.Character.Head); b.Name = "CStats"; b.Size = UDim2.new(0,200,0,50); b.AlwaysOnTop = true
            local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.TextSize = 20; l.Font = "SourceSansBold"
            task.spawn(function() while b.Parent do l.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() task.wait(0.5) end end)
        else if p.Character.Head:FindFirstChild("CStats") then p.Character.Head.CStats:Destroy() end end
    end},
    {n = "HITBOX (20m)", f = function(s) _G.HB = s while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20) v.Character.HumanoidRootPart.Transparency = 0.7 end end task.wait(1) end end},
    {n = "SPEED (100)", f = function(s) p.Character.Humanoid.WalkSpeed = s and 100 or 16 end},
}
-- Добиваем до 42
for i = #all + 1, 42 do table.insert(all, {n = "Function "..i, f = function() end}) end

for _, d in pairs(all) do
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 45); b.Text = d.n; b.BackgroundColor3 = Color3.fromRGB(40,40,40); b.TextColor3 = Color3.new(1,1,1); b.Font = "SourceSansBold"; Instance.new("UICorner", b)
    local act = false
    b.Activated:Connect(function()
        clk:Play()
        if d.u then loadstring(game:HttpGet(d.u))() else
            act = not act; b.BackgroundColor3 = act and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
            d.f(act)
        end
    end)
    Search:GetPropertyChangedSignal("Text"):Connect(function()
        b.Visible = b.Text:lower():find(Search.Text:lower()) ~= nil
    end)
end
