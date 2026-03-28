-- [[ CANDY-BOMB: MEGA VERSION 20+ OPTIONS ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")

-- 1. LOADING SCREEN
local L = Instance.new("ScreenGui", pg); L.Name = "CL"
local LF = Instance.new("Frame", L); LF.Size = UDim2.new(1,0,1,0); LF.BackgroundColor3 = Color3.new(0,0,0); LF.ZIndex = 10
local LT = Instance.new("TextLabel", LF); LT.Size = UDim2.new(1,0,1,0); LT.Text = "CANDY-BOMB LOADING..."; LT.TextColor3 = Color3.new(1,0,0); LT.Font = Enum.Font.SourceSansBold; LT.TextSize = 45
task.delay(3, function() L:Destroy() end)

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 560, 0, 460); M.Position = UDim2.new(0.5, -280, 0.5, -230); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; Instance.new("UICorner", M)

    -- DRAGGABLE SYSTEM
    local dS, sP, dG; M.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dG = true; dS = i.Position; sP = M.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dG = false end end) end end)
    uis.InputChanged:Connect(function(i) if dG and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - dS; M.Position = UDim2.new(sP.X.Scale, sP.X.Offset + d.X, sP.Y.Scale, sP.Y.Offset + d.Y) end end)

    -- КНОПКА DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.new(1,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 135, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", Side)
    local Pages = {}
    local function CreateP(name, vis)
        local f = Instance.new("ScrollingFrame", M); f.Size = UDim2.new(1, -150, 1, -20); f.Position = UDim2.new(0, 140, 0, 10); f.BackgroundTransparency = 1; f.Visible = vis; f.CanvasSize = UDim2.new(0, 0, 6, 0); f.ScrollBarThickness = 3
        Instance.new("UIListLayout", f).Padding = UDim.new(0, 5); Pages[name] = f; return f
    end
    local P1 = CreateP("Scripts", true); local P2 = CreateP("MyHub", false); local P3 = CreateP("Tsunami", false)

    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 125, 0, 45); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 9; b.TextWrapped = true; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for n, pge in pairs(Pages) do pge.Visible = (n == target) end end)
    end
    AddTab("SCRIPTS", "Scripts"); AddTab("MY HUB", "MyHub"); AddTab("TSUNAMI BRAIROT", "Tsunami")

    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 13; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- ВКЛАДКА 1: 11 SCRIPTS
    local function s(n, u) AddB(P1, n, Color3.fromRGB(20,20,20), function() loadstring(game:HttpGet(u))() end) end
    s("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    s("2. Lucky Block (FIX)", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock")
    s("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    s("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    s("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    s("6. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
    s("7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
    s("8. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("9. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")
    s("11. Infinite Yield (Admin)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

    -- ВКЛАДКА 2: MY HUB (20 ОПЦИЙ)
    AddB(P2, "--- STATS & VISUAL ---", Color3.fromRGB(150,0,0), function() end)
    AddB(P2, "CHECK FPS", Color3.fromRGB(0,100,0), function() game:GetService("StarterGui"):SetCore("SendNotification", {Title="FPS", Text=tostring(math.floor(1/rs.RenderStepped:Wait()))}) end)
    AddB(P2, "CHECK PING", Color3.fromRGB(0,100,0), function() game:GetService("StarterGui"):SetCore("SendNotification", {Title="Ping", Text=math.floor(p:GetNetworkPing()*1000).."ms"}) end)
    AddB(P2, "FULL BRIGHT", Color3.fromRGB(40,40,40), function() game.Lighting.Brightness = 2; game.Lighting.ClockTime = 14 end)
    AddB(P2, "--- MOVEMENT ---", Color3.fromRGB(150,0,0), function() end)
    AddB(P2, "SPEED 50", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.WalkSpeed = 50 end)
    AddB(P2, "SPEED 100", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.WalkSpeed = 100 end)
    AddB(P2, "SPEED 200", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.WalkSpeed = 200 end)
    AddB(P2, "JUMP 100", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.JumpPower = 100 end)
    AddB(P2, "JUMP 200", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.JumpPower = 200 end)
    AddB(P2, "GRAVITY 50", Color3.fromRGB(40,40,40), function() workspace.Gravity = 50 end)
    AddB(P2, "GRAVITY NORMAL", Color3.fromRGB(40,40,40), function() workspace.Gravity = 196.2 end)
    AddB(P2, "INF JUMP (ON)", Color3.fromRGB(40,40,40), function() _G.IJ = true; uis.JumpRequest:Connect(function() if _G.IJ then p.Character.Humanoid:ChangeState("Jumping") end end) end)
    AddB(P2, "--- SERVER ---", Color3.fromRGB(150,0,0), function() end)
    AddB(P2, "SERVER HOP", Color3.fromRGB(40,40,40), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EmperorsHacks/ServerHop/main/ServerHop.lua"))() end)
    AddB(P2, "REJOIN", Color3.fromRGB(40,40,40), function() game:GetService("TeleportService"):Teleport(game.PlaceId, p) end)
    AddB(P2, "RESPAWN", Color3.fromRGB(40,40,40), function() p.Character:BreakJoints() end)
    AddB(P2, "FPS BOOSTER", Color3.fromRGB(40,40,40), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FPSBooster"))() end)
    AddB(P2, "--- PLAYERS ---", Color3.fromRGB(150,0,0), function() end)
    AddB(P2, "STOP WATCH", Color3.fromRGB(200,0,0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(P2, "WATCH: "..v.DisplayName, Color3.fromRGB(30,30,30), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    -- ВКЛАДКА 3: TSUNAMI
    AddB(P3, "MYSTRIX HUB 🔥", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB(P3, "AUTO-FARM", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
end

CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
