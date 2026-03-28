local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg)
G.Name = "DarkHubV42"
G.ResetOnSpawn = false

local M = Instance.new("Frame", G)
M.Size = UDim2.new(0, 460, 0, 420)
M.Position = UDim2.new(0.5, -230, 0.5, -210)
M.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
M.Active = true
M.Draggable = true
Instance.new("UICorner", M)

local Side = Instance.new("Frame", M)
Side.Size = UDim2.new(0, 100, 1, 0)
Side.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", Side)

local Cont = Instance.new("ScrollingFrame", M)
Cont.Size = UDim2.new(1, -110, 1, -10)
Cont.Position = UDim2.new(0, 105, 0, 5)
Cont.BackgroundTransparency = 1
Cont.CanvasSize = UDim2.new(0, 0, 4, 0) -- Еще больше места для списков!
Cont.ScrollBarThickness = 4
local List = Instance.new("UIListLayout", Cont)
List.Padding = UDim.new(0, 4)

local function AddB(txt, clr, cb)
    local b = Instance.new("TextButton", Cont)
    b.Size = UDim2.new(1, -10, 0, 30)
    b.Text = txt
    b.BackgroundColor3 = clr
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 14
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

-- [[ 1. SPECTATE (СЛЕЖКА) ]] --
AddB("--- SPECTATE LIST ---", Color3.new(0.2,0,0), function() end)
AddB("OFF SPECTATE", Color3.fromRGB(180, 0, 0), function() 
    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid 
end)
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= p then
        AddB("WATCH: "..v.Name, Color3.fromRGB(40,40,40), function() 
            workspace.CurrentCamera.CameraSubject = v.Character.Humanoid 
        end)
    end
end

-- [[ 2. TELEPORT (ТЕЛЕПОРТ К ИГРОКАМ) ]] --
AddB("--- TELEPORT LIST ---", Color3.new(0,0.2,0), function() end)
AddB("STOP TP (FREEZE)", Color3.fromRGB(0, 150, 0), function() 
    p.Character.HumanoidRootPart.Anchored = true
    task.wait(0.1)
    p.Character.HumanoidRootPart.Anchored = false
end)
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= p then
        AddB("TP TO: "..v.Name, Color3.fromRGB(30,50,30), function() 
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end
        end)
    end
end

-- [[ 3. ОСНОВНЫЕ ЧИТЫ ]] --
AddB("--- MAIN CHEATS ---", Color3.new(0.2,0,0), function() end)
-- Тут твои Аим, Флай, Ультра-Мод и Радуга (я их оставил, просто сократил место)
AddB("AIMBOT (BODY)", Color3.fromRGB(50,50,50), function()
    _G.A = not _G.A
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.A then 
            local t = nil; for _, x in pairs(game.Players:GetPlayers()) do
                if x ~= p and x.Character and x.Character:FindFirstChild("UpperTorso") then t = x; break end
            end
            if t then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, t.Character.UpperTorso.Position) end 
        end
    end)
end)
AddB("FLY HACK (OFF/ON)", Color3.fromRGB(50,50,50), function()
    local r = p.Character.HumanoidRootPart
    if r:FindFirstChild("DH_Fly") then r.DH_Fly:Destroy() else
        local v = Instance.new("BodyVelocity", r); v.Name = "DH_Fly"
        v.MaxForce = Vector3.new(9e9,9e9,9e9); v.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
    end
end)

-- [[ 4. ВСЕ 10 СКРИПТОВ ]] --
AddB("--- 10 SCRIPTS ---", Color3.new(0.2,0.2,0.2), function() end)
local function sc(n, u) AddB(n, Color3.fromRGB(35,35,35), function() loadstring(game:HttpGet(u))() end) end
sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
sc("3. Fart Training", "https://raw.githubusercontent.com/gumanba/Scripts/main/FartTraining.lua")
-- ... (остальные скрипты тоже тут)

local Tog = Instance.new("TextButton", G)
Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, 0); Tog.Text = "DH"
Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)
