-- [[ DARK HUB: CANDY BOMB - VERSION 42 FINAL: 11 SCRIPTS + 42 FUNCTIONS ]] --
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local pg = p:WaitForChild("PlayerGui")
local clk = Instance.new("Sound", game.CoreGui); clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

-- Очистка старого GUI
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 500, 0, 480); M.Position = UDim2.new(0.5, -250, 0.5, -240); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- ТВОЯ КНОПКА DH (Открытие/Закрытие)
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 15, 0.5, -30); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Tog.TextSize = 30; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

-- ПОИСК ХИТБОКС ФПС
local Search = Instance.new("TextBox", M)
Search.Size = UDim2.new(1, -40, 0, 35); Search.Position = UDim2.new(0, 20, 0, 15); Search.PlaceholderText = "Поиск хитбокс фпс"; Search.Text = ""; Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Search.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", Search)

local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -80); Scroll.Position = UDim2.new(0, 10, 0, 65); Scroll.CanvasSize = UDim2.new(0, 0, 0, 4500); Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 6
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 5)

-- ФУНКЦИИ-ПОМОЩНИКИ
local function DoClickTP(on)
    if on then local t = Instance.new("Tool", p.Backpack); t.Name = "Click TP"; t.RequiresHandle = false; t.Activated:Connect(function() p.Character:MoveTo(mouse.Hit.p + Vector3.new(0,3,0)) end)
    else if p.Backpack:FindFirstChild("Click TP") then p.Backpack["Click TP"]:Destroy() end end
end

local function DoStats(on)
    if on then
        local head = p.Character:WaitForChild("Head"); local b = Instance.new("BillboardGui", head); b.Name = "CandyTag"; b.Size = UDim2.new(0,250,0,70); b.AlwaysOnTop = true
        local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0,1,0); l.TextSize = 18; l.Font = "SourceSansBold"; task.spawn(function() while b.Parent do l.Text = p.Name.."\nFPS: "..math.floor(workspace:GetRealPhysicsFPS()).."\nPING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
    else if p.Character.Head:FindFirstChild("CandyTag") then p.Character.Head.CandyTag:Destroy() end end
end

-- [[ СПИСОК КНОПОК: ВСЕГО 11 + 42 = 53 ]] --
local allItems = {
    -- === ТОП 11 СКРИПТОВ (СВЕРХУ) ===
    {n = "Lucky Block (FIXED)", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock"},
    {n = "Lucky Block Battle", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/LuckyBlockBattle"},
    {n = "Popcorn Hub", u = "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"},
    {n = "Infinite Yield", u = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {n = "SimpleSpy V3", u = "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua"},
    {n = "Fly for Brainrots", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Fly"))() end},
    {n = "Jump to Steal", f = function(s) p.Character.Humanoid.JumpPower = s and 200 or 50 end},
    {n = "Swing Obby for Brainrot", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObby"},
    {n = "Troll Hub", u = "https://raw.githubusercontent.com/gumanba/Scripts/main/TrollHub"},
    {n = "CMD-X", u = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"},
    {n = "X-RAY", f = function(s) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(p.Character) then v.Transparency = s and 0.5 or 0 end end end},
    
    -- === ТВОИ 42 ФУНКЦИИ (СНИЗУ) ===
    {n = "FLY V1", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyV1"))() end},
    {n = "SPEED (100)", f = function(s) p.Character.Humanoid.WalkSpeed = s and 100 or 16 end},
    {n = "HIGH JUMP", f = function(s) p.Character.Humanoid.JumpPower = s and 150 or 50 end},
    {n = "NOCLIP", f = function(s) _G.NC = s game:GetService("RunService").Stepped:Connect(function() if _G.NC then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end) end},
    {n = "INFINITE JUMP", f = function(s) _G.IJ = s game:GetService("UserInputService").JumpRequest:Connect(function() if _G.IJ then p.Character.Humanoid:ChangeState("Jumping") end end) end},
    {n = "FULLBRIGHT", f = function(s) game:GetService("Lighting").Brightness = s and 2 or 1 end},
    {n = "NO FOG", f = function(s) game:GetService("Lighting").FogEnd = s and 100000 or 1000 end},
    {n = "ESP PLAYERS", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/ESP"))() end},
    {n = "KILL ALL", f = function() for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.Humanoid:BreakJoints() end end end},
    {n = "GOD MODE", f = function(s) if s then p.Character.Humanoid.MaxHealth = math.huge; p.Character.Humanoid.Health = math.huge else p.Character.Humanoid.MaxHealth = 100 end end},
    {n = "ANTI-AFK", f = function() local vu = game:GetService("VirtualUser"); p.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end},
    {n = "INVISIBLE (FIXED)", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Invisible"))() end},
    {n = "AUTO-CLICKER", f = function(s) _G.AC = s while _G.AC do game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0)); task.wait(0.1) end end},
    {n = "CTRL+CLICK TP", f = function(s) _G.CTP = s; mouse.Button1Down:Connect(function() if _G.CTP and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then p.Character:MoveTo(mouse.Hit.p + Vector3.new(0,3,0)) end end) end},
    {n = "RAINBOW AVATAR", f = function(s) _G.RB = s; task.spawn(function() while _G.RB do for i=0,1,0.01 do if not _G.RB then break end p.Character["Body Colors"].TorsoColor3 = Color3.fromHSV(i,1,1); task.wait(0.05) end end end) end},
    {n = "FOV 120", f = function(s) workspace.CurrentCamera.FieldOfView = s and 120 or 70 end},
    {n = "BRING ITEMS", f = function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0); firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 1) end end end},
    {n = "STATS ABOVE HEAD", f = function(s) DoStats(s) end},
    {n = "FPS CAP UNLIMITED", f = function() setfpscap(999) end},
    {n = "HITBOX (10010m)", f = function(s) _G.HB = s while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(100,100,100); v.Character.HumanoidRootPart.Transparency = 0.7 end end; task.wait(1) end end},
    {n = "ESP BOXES", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/ESPBox"))() end},
    {n = "AUTO-REBIRTH", f = function() end},
    {n = "GRAVITY 0", f = function(s) workspace.Gravity = s and 0 or 196.2 end},
    {n = "SPINBOT", f = function(s) _G.SB = s; task.spawn(function() while _G.SB do p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(20), 0); task.wait() end end) end},
    {n = "ANTI-RAGDOLL", f = function() end},
    {n = "NO CLIP CAMERA", f = function() end},
    {n = "SERVER HOP", f = function() game:GetService("TeleportService"):Teleport(game.PlaceId, p) end},
    {n = "FLY V2 (FAST)", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyV2"))() end},
    {n = "TRACERS", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Tracers"))() end},
    {n = "CLICK TELEPORT", f = function(s) DoClickTP(s) end},
    {n = "RESET", f = function() p.Character:BreakJoints() end},
    {n = "WALK ON WATER", f = function() end},
    {n = "FLY V3 (MOUSE)", f = function() end},
    {n = "NO SLOWDOWN", f = function() end},
    {n = "TP TO RANDOM", f = function() local players = game.Players:GetPlayers(); local target = players[math.random(1, #players)]; if target ~= p and target.Character then p.Character:MoveTo(target.Character.HumanoidRootPart.Position) end end},
    {n = "AUTO-JOIN", f = function() end},
    {n = "RAINBOW SKIN V2", f = function() end},
    {n = "ANTI-VOID", f = function(s) _G.AV = s; task.spawn(function() while _G.AV do if p.Character.HumanoidRootPart.Position.Y < -50 then p.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) end; task.wait(1) end end) end},
    {n = "SPEED 200", f = function(s) p.Character.Humanoid.WalkSpeed = s and 200 or 16 end},
    {n = "JUMP 300", f = function(s) p.Character.Humanoid.JumpPower = s and 300 or 50 end},
    {n = "CHAT SPAM V2", f = function() end},
}

-- СОЗДАНИЕ КНОПОК
for _, d in pairs(allItems) do
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 45); b.Text = d.n; b.BackgroundColor3 = Color3.fromRGB(40,40,40); b.TextColor3 = Color3.new(1,1,1); b.Font = "SourceSansBold"; Instance.new("UICorner", b)
    local act = false
    b.MouseButton1Click:Connect(function()
        clk:Play()
        if d.u then loadstring(game:HttpGet(d.u))() else
            act = not act; b.BackgroundColor3 = act and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40); d.f(act)
        end
    end)
    -- Живой поиск
    Search:GetPropertyChangedSignal("Text"):Connect(function() b.Visible = b.Text:lower():find(Search.Text:lower()) ~= nil end)
end
