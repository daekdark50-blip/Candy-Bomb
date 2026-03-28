local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 460, 0, 420); M.Position = UDim2.new(0.5, -230, 0.5, -210); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 100, 1, 0); Side.BackgroundColor3 = Color3.new(0,0,0); Instance.new("UICorner", Side)
local Cont = Instance.new("ScrollingFrame", M); Cont.Size = UDim2.new(1, -110, 1, -10); Cont.Position = UDim2.new(0, 105, 0, 5); Cont.BackgroundTransparency = 1; Cont.CanvasSize = UDim2.new(0, 0, 6, 0); Cont.ScrollBarThickness = 4
Instance.new("UIListLayout", Cont).Padding = UDim.new(0, 4)

local function AddB(txt, clr, cb)
    local b = Instance.new("TextButton", Cont); b.Size = UDim2.new(1, -10, 0, 35); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
end

-- [[ 1. SPECTATE LIST ]] --
AddB("--- SPECTATE LIST ---", Color3.new(0.4, 0, 0), function() end)
AddB("STOP SPECTATE (OFF)", Color3.fromRGB(150, 0, 0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= p then AddB("WATCH: "..v.Name, Color3.fromRGB(40, 40, 40), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
end

-- [[ 2. TELEPORT LIST ]] --
AddB("--- TELEPORT LIST ---", Color3.new(0, 0.4, 0), function() end)
_G.TP_LOOP = false
AddB("STOP TP (OFF)", Color3.fromRGB(150, 0, 0), function() _G.TP_LOOP = false end)
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= p then 
        AddB("TP TO: "..v.Name, Color3.fromRGB(30, 50, 30), function() 
            _G.TP_LOOP = true
            while _G.TP_LOOP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") do
                p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                task.wait(0.1)
            end
        end) 
    end
end

-- [[ 3. MAIN CHEATS ]] --
AddB("--- MAIN CHEATS ---", Color3.new(0.4, 0, 0), function() end)
AddB("AIMBOT (BODY)", Color3.fromRGB(50, 50, 50), function()
    _G.A = not _G.A; game:GetService("RunService").RenderStepped:Connect(function()
        if _G.A then local t = nil; for _, x in pairs(game.Players:GetPlayers()) do if x ~= p and x.Character and x.Character:FindFirstChild("UpperTorso") then t = x; break end end
        if t then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, t.Character.UpperTorso.Position) end end
    end)
end)
AddB("FLY HACK (OFF/ON)", Color3.fromRGB(50, 50, 50), function()
    local r = p.Character.HumanoidRootPart; if r:FindFirstChild("DH_Fly") then r.DH_Fly:Destroy() else
    local v = Instance.new("BodyVelocity", r); v.Name = "DH_Fly"; v.MaxForce = Vector3.new(9e9, 9e9, 9e9); v.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60 end
end)
AddB("ULTRA MOD (INV/SPD/HIT)", Color3.fromRGB(80, 0, 0), function()
    p.Character.Humanoid.WalkSpeed = 100; for _, x in pairs(p.Character:GetDescendants()) do if x:IsA("BasePart") then x.Transparency = 0.5 end end
    for _, x in pairs(game.Players:GetPlayers()) do if x ~= p and x.Character then x.Character.Head.Size = Vector3.new(20,20,20); x.Character.Head.CanCollide = false end end
end)
AddB("RAINBOW SKIN", Color3.fromRGB(50, 50, 50), function()
    task.spawn(function() while task.wait() do for _, x in pairs(p.Character:GetChildren()) do if x:IsA("BasePart") then x.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end end end)
end)

-- [[ 4. 10 SCRIPTS ]] --
AddB("--- 10 SCRIPTS ---", Color3.new(0.3, 0.3, 0.3), function() end)
local function sc(n, u) AddB(n, Color3.fromRGB(35, 35, 35), function() loadstring(game:HttpGet(u))() end) end

sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
sc("3. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
sc("4. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
sc("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
sc("6. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
sc("7. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
sc("8. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
sc("9. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
sc("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")

local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, 0); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)
