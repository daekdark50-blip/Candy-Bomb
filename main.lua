-- [[ CANDY-BOMB: 42 FUNCTIONS OVERKILL EDITION ]] --
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
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 520, 0, 480); M.Position = UDim2.new(0.5, -260, 0.5, -240); M.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", M)

    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 20, 0.5, -25); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(200,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 25; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -20); Scroll.Position = UDim2.new(0, 10, 0, 10); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0, 0, 0, 5200); Scroll.ScrollBarThickness = 4
    Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 8)

    local function AddB(txt, clr, cb)
        local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 48); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 16; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb); return b
    end

    local function AddTitle(txt)
        local l = Instance.new("TextLabel", Scroll); l.Size = UDim2.new(1, 0, 0, 35); l.Text = "--- "..txt.." ---"; l.TextColor3 = Color3.new(0.8, 0, 0); l.Font = Enum.Font.SourceSansBold; l.TextSize = 18; l.BackgroundTransparency = 1
    end

    AddTitle("11 MAIN SCRIPTS")
    local function s(n, u) AddB(n, Color3.fromRGB(30,30,30), function() loadstring(game:HttpGet(u))() end) end
    s("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    s("2. Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock")
    s("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    s("4. Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    s("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    s("6. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
    s("7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
    s("8. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("9. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")
    s("11. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

    AddTitle("MY HUB: 42 FUNCTIONS")
    local myFuncs = {
        {n = "FLY V1", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))() end},
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
        {n = "INVISIBLE (FIXED)", f = function(on) for _, v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = on and 1 or 0 end end end},
        {n = "AUTO-CLICKER", f = function(on) _G.AC = on; while _G.AC do task.wait(); game:GetService("VirtualUser"):ClickButton1(Vector2.new()) end end},
        {n = "CTRL+CLICK TP", f = function(on) uis.InputBegan:Connect(function(i) if on and i.UserInputType == Enum.UserInputType.MouseButton1 and uis:IsKeyDown(Enum.KeyCode.LeftControl) then p.Character:MoveTo(uis:GetMouseLocation()) end end) end},
        {n = "RAINBOW AVATAR", f = function(on) _G.RBV = on; while _G.RBV do for i=0,1,0.01 do if not _G.RBV then break end; local clr = Color3.fromHSV(i,1,1); for _,obj in pairs(p.Character:GetDescendants()) do if obj:IsA("BasePart") or obj:IsA("MeshPart") then obj.Color = clr end end; task.wait() end end end},
        {n = "FOV 120", f = function(on) workspace.CurrentCamera.FieldOfView = on and 120 or 70 end},
        {n = "BRING ITEMS", f = function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and v.Name == "Handle" then v.CFrame = p.Character.HumanoidRootPart.CFrame end end end},
        {n = "STATS ABOVE HEAD", f = function(on) 
            if on then
                local bg = Instance.new("BillboardGui", p.Character.Head); bg.Name = "CandyStats"; bg.Size = UDim2.new(0,200,0,50); bg.AlwaysOnTop = true; bg.ExtentsOffset = Vector3.new(0,3,0)
                local tl = Instance.new("TextLabel", bg); tl.Size = UDim2.new(1,0,1,0); tl.BackgroundTransparency = 1; tl.TextColor3 = Color3.new(0,1,0); tl.Font = Enum.Font.SourceSansBold; tl.TextSize = 20
                spawn(function() while on and bg.Parent do tl.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
            elseif p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
        end},
        {n = "FPS CAP UNLIMITED", f = function() setfpscap(999) end},
        {n = "HITBOX (10010m)", f = function(on) _G.HB = on; while _G.HB do task.wait(1) for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then v.Character.HumanoidRootPart.Size = on and Vector3.new(10010,10010,10010) or Vector3.new(2,2,1); v.Character.HumanoidRootPart.Transparency = on and 0.7 or 0 end end end end},
        {n = "ESP BOXES", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Iratuosity/ESP/main/BoxESP"))() end},
        {n = "AUTO-REBIRTH", f = function(on) _G.AR = on; while _G.AR do game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(); task.wait(1) end end},
        {n = "GRAVITY 0", f = function(on) workspace.Gravity = on and 0 or 196.2 end},
        {n = "SPINBOT", f = function(on) _G.Spin = on; while _G.Spin do p.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(20), 0); task.wait() end end},
        {n = "ANTI-RAGDOLL", f = function(on) p.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not on) end},
        {n = "NO CLIP CAMERA", f = function(on) p.DevCameraOcclusionMode = on and "Invisicam" or "Zoom" end},
        {n = "X-RAY", f = function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier = on and 0.5 or 0 end end end},
        {n = "SERVER HOP", f = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end},
        {n = "FLY V2 (FAST)", f = function(on) p.Character.Humanoid.PlatformStand = on end},
        {n = "TRACERS", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Tracers-Script/main/Tracers.lua"))() end},
        {n = "CLICK TELEPORT", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/ClickTP"))() end},
        {n = "RESET", f = function() p.Character.Humanoid.Health = 0 end},
        -- НОВЫЕ 10
        {n = "WALK ON WATER", f = function(on) if on then local part = Instance.new("Part", workspace); part.Name = "WaterWalk"; part.Size = Vector3.new(5000, 2, 5000); part.Position = p.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0); part.Anchored = true; part.Transparency = 1 else if workspace:FindFirstChild("WaterWalk") then workspace.WaterWalk:Destroy() end end end},
        {n = "FLY V3 (MOUSE)", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyMouse"))() end},
        {n = "NO SLOWDOWN", f = function(on) rs.RenderStepped:Connect(function() if on then p.Character.Humanoid.WalkSpeed = 100 end end) end},
        {n = "TP TO RANDOM", f = function() local r = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]; p.Character.HumanoidRootPart.CFrame = r.Character.HumanoidRootPart.CFrame end},
        {n = "AUTO-JOIN", f = function() game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function() game:GetService("TeleportService"):Teleport(game.PlaceId) end) end},
        {n = "RAINBOW SKIN V2", f = function(on) _G.RS2 = on; while _G.RS2 do for i=0,1,0.01 do if not _G.RS2 then break end; p.Character["Body Colors"].HeadColor3 = Color3.fromHSV(i,1,1); task.wait() end end end},
        {n = "ANTI-VOID", f = function(on) spawn(function() while on do if p.Character.HumanoidRootPart.Position.Y < -50 then p.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) end; task.wait(1) end end) end},
        {n = "SPEED 200", f = function(on) p.Character.Humanoid.WalkSpeed = on and 200 or 16 end},
        {n = "JUMP 300", f = function(on) p.Character.Humanoid.JumpPower = on and 300 or 50 end},
        {n = "CHAT SPAM V2", f = function(on) while on do game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("CANDY ON TOP!", "All"); task.wait(1) end end}
    }

    for _, v in pairs(myFuncs) do
        local state = false
        local b; b = AddB(v.n..": OFF", Color3.fromRGB(80,0,0), function()
            state = not state; b.Text = v.n..": "..(state and "ON" or "OFF")
            b.BackgroundColor3 = (state and Color3.fromRGB(0,120,0) or Color3.fromRGB(80,0,0))
            v.f(state, b)
        end)
    end

    AddTitle("AUTO FARM & ULTIMATE")
    AddB("🔥 MYSTRIX HUB", Color3.fromRGB(0, 80, 180), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB("🌊 AUTO FARM TSUNAMI", Color3.fromRGB(0, 80, 180), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
    AddB("📦 AUTO COLLECTOR", Color3.fromRGB(0, 80, 180), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0) end end end)
end

StartLoading()
