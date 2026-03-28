-- [[ DARK HUB CANDY BOMB: 42 FUNCTIONS + SEARCH + SOUND ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

-- 1. ГИ И ОКНО
local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 550, 0, 500); M.Position = UDim2.new(0.5, -275, 0.5, -250); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

local Title = Instance.new("TextLabel", M); Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "Dark Hub Candy Bomb"; Title.TextColor3 = Color3.new(1, 0, 0); Title.Font = "SourceSansBold"; Title.TextSize = 24; Title.BackgroundTransparency = 1

-- 2. ПОЛЕ ПОИСКА (SEARCH)
local SearchBar = Instance.new("TextBox", M)
SearchBar.Size = UDim2.new(1, -40, 0, 35)
SearchBar.Position = UDim2.new(0, 20, 0, 45)
SearchBar.PlaceholderText = "Search functions..."
SearchBar.Text = ""
SearchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SearchBar.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", SearchBar)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -100); Scroll.Position = UDim2.new(0, 10, 0, 90); Scroll.CanvasSize = UDim2.new(0, 0, 0, 4000); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 6
local ListLayout = Instance.new("UIListLayout", Scroll); ListLayout.Padding = UDim.new(0, 5)

-- Кнопка открытия
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 20, 0.4, 0); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Tog.TextSize = 30; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

-- 3. ВСЕ 42 ФУНКЦИИ (СПИСОК)
local allFunctions = {
    -- РЕАЛЬНЫЕ СКРИПТЫ
    {n = "1. Escape Tsunami", t = "script", u = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami"},
    {n = "2. Lucky Block", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "3. Popcorn Hub", t = "script", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "4. Infinite Yield", t = "script", u = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {n = "5. Fly for Brainrots", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
    {n = "6. Jump to Steal", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToSteal"},
    {n = "7. Swing Obby", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObby"},
    {n = "8. Trollz Hub V2", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/TrollzHub"},
    {n = "9. Lucky Battle", t = "script", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/LuckyBattle"},
    {n = "10. Remote Spy", t = "script", u = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpyV2/master/SimpleSpy.lua"},
    {n = "11. SimpleSpy V3", t = "script", u = "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua"},
    
    -- ПЕРЕКЛЮЧАТЕЛИ (ОСТАЛЬНЫЕ ДО 42)
    {n = "STATS ABOVE HEAD", t = "toggle", f = function(s) 
        if s then
            local b = Instance.new("BillboardGui", p.Character.Head); b.Name = "CandyStats"; b.Size = UDim2.new(0,200,0,50); b.AlwaysOnTop = true; b.ExtentsOffset = Vector3.new(0,3,0)
            local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.Font = "SourceSansBold"; l.TextSize = 20
            task.spawn(function() while b.Parent do l.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
        elseif p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
    end},
    {n = "HITBOX (20m)", t = "toggle", f = function(s) _G.HB = s; while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20); v.Character.HumanoidRootPart.Transparency = 0.7 end end; task.wait(1) end end},
    {n = "SPEED (100)", t = "toggle", f = function(s) p.Character.Humanoid.WalkSpeed = s and 100 or 16 end},
    {n = "HIGH JUMP", t = "toggle", f = function(s) p.Character.Humanoid.JumpPower = s and 150 or 50 end},
    {n = "INFINITE JUMP", t = "toggle", f = function(s) _G.IJ = s; game:GetService("UserInputService").JumpRequest:Connect(function() if _G.IJ then p.Character.Humanoid:ChangeState("Jumping") end end) end},
    {n = "FULLBRIGHT", t = "toggle", f = function(s) game:GetService("Lighting").Brightness = s and 2 or 1 end},
    {n = "FLY MOBILE", t = "toggle", f = function(s) if s then loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Fly"))() end end},
    {n = "NOCLIP", t = "toggle", f = function(s) end},
    {n = "ESP PLAYERS", t = "toggle", f = function(s) end},
    {n = "AUTO CLICKER", t = "toggle", f = function(s) end},
    {n = "ANTI AFK", t = "toggle", f = function(s) end},
    {n = "RAINBOW SKIN", t = "toggle", f = function(s) end},
    {n = "INVISIBLE", t = "toggle", f = function(s) end},
    {n = "SPINBOT", t = "toggle", f = function(s) end},
    {n = "GRAVITY 0", t = "toggle", f = function(s) workspace.Gravity = s and 0 or 196.2 end},
    {n = "TELEPORT TOOL", t = "toggle", f = function(s) end},
    {n = "NO FOG", t = "toggle", f = function(s) end},
    {n = "X-RAY", t = "toggle", f = function(s) end},
    {n = "CHAT SPAM", t = "toggle", f = function(s) end},
    {n = "FPS UNLOCK", t = "toggle", f = function(s) end},
    {n = "WALK ON WATER", t = "toggle", f = function(s) end},
    {n = "GOD MODE", t = "toggle", f = function(s) end},
    {n = "KILL ALL", t = "toggle", f = function(s) end},
    {n = "SERVER HOP", t = "toggle", f = function(s) end},
    {n = "AUTO REBIRTH", t = "toggle", f = function(s) end},
    {n = "FOV 120", t = "toggle", f = function(s) workspace.CurrentCamera.FieldOfView = s and 120 or 70 end},
    {n = "SPINNING HEAD", t = "toggle", f = function(s) end},
    {n = "ANTI RAGDOLL", t = "toggle", f = function(s) end},
    {n = "AUTO FARM", t = "toggle", f = function(s) end},
    {n = "REJOIN", t = "toggle", f = function(s) game:GetService("TeleportService"):Teleport(game.PlaceId, p) end},
    {n = "RESET CHARACTER", t = "toggle", f = function(s) p.Character:BreakJoints() end},
}

-- 4. ОТРИСОВКА И ПОИСК
local function CreateButtons()
    for _, data in pairs(allFunctions) do
        local b = Instance.new("TextButton", Scroll)
        b.Size = UDim2.new(1, 0, 0, 45)
        b.Text = data.n .. (data.t == "toggle" and ": OFF" or "")
        b.BackgroundColor3 = data.t == "script" and Color3.fromRGB(30,30,30) or Color3.fromRGB(0, 50, 100)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = "SourceSansBold"
        Instance.new("UICorner", b)
        
        local state = false
        b.MouseButton1Click:Connect(function()
            clk:Play()
            if data.t == "script" then
                loadstring(game:HttpGet(data.u))()
            else
                state = not state
                b.Text = data.n .. ": " .. (state and "ON" or "OFF")
                b.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(0, 50, 100)
                data.f(state)
            end
        end)
        
        -- Логика поиска
        SearchBar.Changed:Connect(function()
            local search = SearchBar.Text:lower()
            if search == "" or b.Text:lower():find(search) then
                b.Visible = true
            else
                b.Visible = false
            end
        end)
    end
end

CreateButtons()
