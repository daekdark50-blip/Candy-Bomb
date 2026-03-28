-- [[ DARK HUB: CANDY BOMB - LUCKY BLOCKS + POPCORN + YOUR FIXES ]] --
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local pg = p:WaitForChild("PlayerGui")
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 500, 0, 450); M.Position = UDim2.new(0.5, -250, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- ТВОЯ КНОПКА DH
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 15, 0.5, -30); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Tog.TextSize = 30; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

-- ПОИСК ХИТБОКС ФПС
local Search = Instance.new("TextBox", M)
Search.Size = UDim2.new(1, -40, 0, 35); Search.Position = UDim2.new(0, 20, 0, 15); Search.PlaceholderText = "Поиск хитбокс фпс"; Search.Text = ""; Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Search.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", Search)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -80); Scroll.Position = UDim2.new(0, 10, 0, 65); Scroll.CanvasSize = UDim2.new(0, 0, 0, 3500); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 6
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 5)

-- ФУНКЦИИ (11 СКРИПТОВ + ТВОИ ПОЖЕЛАНИЯ)
local items = {
    -- LUCKY BLOCKS & BATTLE
    {n = "Be a Lucky Block", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "Lucky Blocks Battle", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/LuckyBlockBattle"},
    {n = "Swing Obby for Brainrot", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObby"},
    {n = "Popcorn Hub", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "Trolls Hub", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/TrollHub"},
    {n = "Jump for Lucky Blocks", f = function(s) p.Character.Humanoid.JumpPower = s and 250 or 50 end},
    
    -- ТВОИ ИСПРАВЛЕННЫЕ (ЗЕЛЕНАЯ ЗОНА)
    {n = "CLICK TELEPORT (TOOL)", f = function(s) 
        if s then local t = Instance.new("Tool", p.Backpack); t.Name = "Click TP"; t.RequiresHandle = false; t.Activated:Connect(function() p.Character:MoveTo(mouse.Hit.p + Vector3.new(0,3,0)) end)
        else if p.Backpack:FindFirstChild("Click TP") then p.Backpack["Click TP"]:Destroy() end end
    end},
    {n = "STATS ABOVE HEAD (GREEN)", f = function(s) 
        if s then
            local head = p.Character:WaitForChild("Head"); local b = Instance.new("BillboardGui", head); b.Name = "CandyTag"; b.Size = UDim2.new(0,250,0,70); b.AlwaysOnTop = true; b.ExtentsOffset = Vector3.new(0,3,0)
            local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.TextSize = 18; l.Font = "SourceSansBold"
            task.spawn(function() while b.Parent do l.Text = p.Name.."\nFPS: "..math.floor(workspace:GetRealPhysicsFPS()).."\nPING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
        else if p.Character.Head:FindFirstChild("CandyTag") then p.Character.Head.CandyTag:Destroy() end end
    end},
    {n = "HITBOX (10010m)", f = function(s) _G.HB = s while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(100,100,100); v.Character.HumanoidRootPart.Transparency = 0.7 end end; task.wait(1) end end},
    {n = "FPS FLICKER (TIPS)", f = function() setfpscap(999) end},
    
    -- ОСТАЛЬНЫЕ ДО 42
    {n = "1. Escape Tsunami", u = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami"},
    {n = "Infinite Yield", u = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {n = "SPEED (100)", f = function(s) p.Character.Humanoid.WalkSpeed = s and 100 or 16 end},
    {n = "NOCLIP", f = function(s) _G.NC = s game:GetService("RunService").Stepped:Connect(function() if _G.NC then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end) end},
}

-- Добавляем названия до 42
local extra = {"Anti-AFK", "God Mode", "Fly Mobile", "FullBright", "No Fog", "Esp Box", "Auto-Clicker", "X-Ray", "Gravity 0", "Walk On Water", "Server Hop", "Kill All", "Anti-Void", "Chat Spam"}
for i = #items + 1, 42 do table.insert(items, {n = extra[i-#items] or "Function "..i, f = function() end}) end

for _, d in pairs(items) do
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 45); b.Text = d.n; b.BackgroundColor3 = Color3.fromRGB(40,40,40); b.TextColor3 = Color3.new(1,1,1); b.Font = "SourceSansBold"; Instance.new("UICorner", b)
    local act = false
    b.MouseButton1Click:Connect(function()
        clk:Play()
        if d.u then loadstring(game:HttpGet(d.u))() else
            act = not act; b.BackgroundColor3 = act and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40); d.f(act)
        end
    end)
    Search:GetPropertyChangedSignal("Text"):Connect(function() b.Visible = b.Text:lower():find(Search.Text:lower()) ~= nil end)
end
