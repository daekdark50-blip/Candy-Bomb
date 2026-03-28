local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- 1. Удаляем старое меню, чтобы не плодить копии
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

local G = Instance.new("ScreenGui", pg)
G.Name = "DarkHubV42"
G.ResetOnSpawn = false

-- 2. Главное Окно (Как на твоем скрине)
local M = Instance.new("Frame", G)
M.Size = UDim2.new(0, 460, 0, 420)
M.Position = UDim2.new(0.5, -230, 0.5, -210)
M.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
M.Active = true
M.Draggable = true
Instance.new("UICorner", M)

-- Боковая панель (черная полоска слева)
local Side = Instance.new("Frame", M)
Side.Size = UDim2.new(0, 100, 1, 0)
Side.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", Side)

-- Список кнопок с прокруткой (Scrolling)
local Cont = Instance.new("ScrollingFrame", M)
Cont.Size = UDim2.new(1, -110, 1, -10)
Cont.Position = UDim2.new(0, 105, 0, 5)
Cont.BackgroundTransparency = 1
Cont.CanvasSize = UDim2.new(0, 0, 2.8, 0) -- Хватит места на всё!
Cont.ScrollBarThickness = 4
local List = Instance.new("UIListLayout", Cont)
List.Padding = UDim.new(0, 4)

-- Функция для создания кнопок
local function AddB(txt, clr, cb)
    local b = Instance.new("TextButton", Cont)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Text = txt
    b.BackgroundColor3 = clr
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 16
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

-- [[ РАЗДЕЛ 1: SPECTATE (СЛЕЖКА) ]] --
AddB("--- SPECTATE LIST ---", Color3.new(0.2,0,0), function() end)
AddB("STOP SPECTATE", Color3.fromRGB(180, 0, 0), function() 
    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid 
end)

for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= p then
        AddB("WATCH: "..v.Name, Color3.fromRGB(40,40,40), function() 
            workspace.CurrentCamera.CameraSubject = v.Character.Humanoid 
        end)
    end
end

-- [[ РАЗДЕЛ 2: ОСНОВНЫЕ ЧИТЫ ]] --
AddB("--- MAIN CHEATS ---", Color3.new(0.2,0,0), function() end)

AddB("AIMBOT (BODY)", Color3.fromRGB(50,50,50), function()
    _G.A = not _G.A
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.A then 
            local t = nil; local d = 1000
            for _, x in pairs(game.Players:GetPlayers()) do
                if x ~= p and x.Character and x.Character:FindFirstChild("UpperTorso") then t = x; break end
            end
            if t then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, t.Character.UpperTorso.Position) end 
        end
    end)
end)

AddB("FLY HACK", Color3.fromRGB(50,50,50), function()
    local r = p.Character.HumanoidRootPart
    local v = r:FindFirstChild("DH_Fly") or Instance.new("BodyVelocity", r)
    v.Name = "DH_Fly"; v.MaxForce = Vector3.new(9e9,9e9,9e9)
    v.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
end)

AddB("ULTRA MOD (INV/SPD/HIT)", Color3.fromRGB(80, 0, 0), function()
    p.Character.Humanoid.WalkSpeed = 100
    for _, x in pairs(p.Character:GetDescendants()) do if x:IsA("BasePart") then x.Transparency = 0.5 end end
    for _, x in pairs(game.Players:GetPlayers()) do
        if x ~= p and x.Character and x.Character:FindFirstChild("Head") then 
            x.Character.Head.Size = Vector3.new(20,20,20); x.Character.Head.CanCollide = false 
        end
    end
end)

AddB("RAINBOW SKIN", Color3.fromRGB(50,50,50), function()
    task.spawn(function() while task.wait() do 
        for _, x in pairs(p.Character:GetChildren()) do if x:IsA("BasePart") then x.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end 
    end end)
end)

-- [[ РАЗДЕЛ 3: ВСЕ 10 СКРИПТОВ ]] --
AddB("--- 10 SCRIPTS ---", Color3.new(0.2,0,0), function() end)
local function sc(n, u) AddB(n, Color3.fromRGB(35,35,35), function() loadstring(game:HttpGet(u))() end) end

sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
sc("2. Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
sc("3. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
sc("4. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
sc("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
sc("6. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
sc("7. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
sc("8. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
sc("9. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
sc("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")

-- КНОПКА DH (ОТКРЫТЬ/ЗАКРЫТЬ)
local Tog = Instance.new("TextButton", G)
Tog.Size = UDim2.new(0, 50, 0, 50)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.BackgroundColor3 = Color3.new(0,0,0)
Tog.TextColor3 = Color3.new(1,0,0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)
