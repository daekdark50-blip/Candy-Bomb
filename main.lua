-- [[ CANDY-BOMB: 22 FUNCTIONS EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyLoading") then pg.CandyLoading:Destroy() end

local function StartLoading()
    local LG = Instance.new("ScreenGui", pg); LG.Name = "CandyLoading"
    local MainF = Instance.new("Frame", LG); MainF.Size = UDim2.new(1,0,1,0); MainF.BackgroundColor3 = Color3.new(0,0,0); MainF.ZIndex = 100
    local logo = Instance.new("TextLabel", MainF); logo.Size = UDim2.new(0,200,0,200); logo.Position = UDim2.new(0.5,-100,0.3,0); logo.Text = "DH"; logo.TextColor3 = Color3.fromRGB(200,0,0); logo.Font = Enum.Font.SourceSansBold; logo.TextSize = 120; logo.BackgroundTransparency = 1
    ts:Create(Instance.new("Frame", MainF), TweenInfo.new(3), {Size = UDim2.new(1,0,1,0)}):Play()
    task.wait(3); LG:Destroy(); CreateCandyHub()
end

function CreateCandyHub()
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 520, 0, 450); M.Position = UDim2.new(0.5, -260, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", M)

    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 20, 0.5, -25); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(200,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 25; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -20); Scroll.Position = UDim2.new(0, 10, 0, 10); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0, 0, 0, 3100); Scroll.ScrollBarThickness = 4
    Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 8)

    local function AddB(txt, clr, cb)
        local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 48); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 16; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb); return b
    end

    local function AddTitle(txt)
        local l = Instance.new("TextLabel", Scroll); l.Size = UDim2.new(1, 0, 0, 35); l.Text = "--- "..txt.." ---"; l.TextColor3 = Color3.new(0.8, 0, 0); l.Font = Enum.Font.SourceSansBold; l.TextSize = 18; l.BackgroundTransparency = 1
    end

    -- 1. ОСНОВНЫЕ СКРИПТЫ
    AddTitle("11 MAIN SCRIPTS")
    local function s(n, u) AddB(n, Color3.fromRGB(30,30,30), function() loadstring(game:HttpGet(u))() end) end
    s("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    s("2. Lucky Block (FIXED)", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock")
    s("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    s("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    s("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    s("6. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
    s("7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
    s("8. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("9. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")
    s("11. Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

    -- 2. MY HUB: 22 FUNCTIONS
    AddTitle("MY HUB: 22 FUNCTIONS")
    local myFuncs = {
        {n = "FLY", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))() end},
        {n = "SPEED (100)", f = function(on) p.Character.Humanoid.WalkSpeed = on and 100 or 16 end},
        {n = "HIGH JUMP", f = function(on) p.Character.Humanoid.JumpPower = on and 150 or 50 end},
        {n = "NOCLIP", f = function(on) rs.Stepped:Connect(function() if on then for _, v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end) end},
        {n = "INFINITE JUMP", f = function(on) uis.JumpRequest:Connect(function() if on then p.Character.Humanoid:ChangeState("Jumping") end end) end},
        {n = "FULLBRIGHT", f = function(on) game.Lighting.Brightness = on and 2 or 1; game.Lighting.ClockTime = on and 14 or 12 end},
        {n = "NO FOG", f = function(on) game.Lighting.FogEnd = on and 100000 or 1000 end},
        {n = "ESP PLAYERS", f = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHub.lua'))() end},
        {n = "KILL ALL", f = function() for _,v in pairs(game.Players:GetPlayers()) do if v ~= p then v.Character.Humanoid.Health = 0 end end end},
        {n = "GOD MODE", f = function(on) p.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, not on) end},
        {n = "ANTI-AFK", f = function() local v=game:GetService("VirtualUser"); p.Idled:Connect(function() v:CaptureController(); v:ClickButton2(Vector2.new()) end) end},
        {n = "INVISIBLE", f = function() p.Character.LowerTorso:Destroy() end},
        {n = "AUTO-CLICKER", f = function(on) _G.AC = on; while _G.AC do task.wait(); game:GetService("VirtualUser"):ClickButton1(Vector2.new()) end end},
        {n = "CTRL+CLICK TP", f = function(on) uis.InputBegan:Connect(function(i) if on and i.UserInputType == Enum.UserInputType.MouseButton1 and uis:IsKeyDown(Enum.KeyCode.LeftControl) then p.Character:MoveTo(uis:GetMouseLocation()) end end) end},
        {n = "RAINBOW SKIN", f = function(on) _G.RB = on; while _G.RB do for i=0,1,0.01 do if not _G.RB then break end; p.Character.Head.Color = Color3.fromHSV(i,1,1); task.wait() end end end},
        {n = "FOV 120", f = function(on) workspace.CurrentCamera.FieldOfView = on and 120 or 70 end},
        {n = "BRING ITEMS", f = function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and v.Name == "Handle" then v.CFrame = p.Character.HumanoidRootPart.CFrame end end end},
        {n = "CHAT SPAMMER", f = function(on) _G.SP = on; while _G.SP do game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("CANDY HUB!", "All"); task.wait(2) end end},
        {n = "RESET", f = function() p.Character.Humanoid.Health = 0 end},
        {n = "FPS CAP 999", f = function() setfpscap(999) end},
        -- НОВЫЕ ФУНКЦИИ (21 и 22)
        {n = "SHOW FPS", f = function(on, btn) _G.FPS = on; while _G.FPS do task.wait(1); btn.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()) end; btn.Text = "SHOW FPS: OFF" end},
        {n = "SHOW PING", f = function(on, btn) _G.PNG = on; while _G.PNG do task.wait(1); local png = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); btn.Text = "PING: "..png end; btn.Text = "SHOW PING: OFF" end}
    }

    for _, v in pairs(myFuncs) do
        local state = false
        local b; b = AddB(v.n..": OFF", Color3.fromRGB(80,0,0), function()
            state = not state; b.Text = v.n..": "..(state and "ON" or "OFF")
            b.BackgroundColor3 = (state and Color3.fromRGB(0,120,0) or Color3.fromRGB(80,0,0))
            v.f(state, b)
        end)
    end

    -- 3. AUTO FARM
    AddTitle("AUTO FARM & ULTIMATE")
    AddB("🔥 MYSTRIX HUB", Color3.fromRGB(0, 80, 180), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB("🌊 AUTO FARM TSUNAMI", Color3.fromRGB(0, 80, 180), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
end

StartLoading()
