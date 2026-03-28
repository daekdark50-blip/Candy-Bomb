-- [[ CANDY-BOMB HUB: FULL RETURN EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")

_G.Toggles = {RainbowSkin = false, SpinFling = false, ESP = false, InfJump = false}

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 550, 0, 450); M.Position = UDim2.new(0.5, -275, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- FPS & PING
    local Info = Instance.new("TextLabel", M); Info.Size = UDim2.new(1, 0, 0, 20); Info.Position = UDim2.new(0, 0, 1, -25); Info.BackgroundTransparency = 1; Info.TextColor3 = Color3.new(1,1,1); Info.Font = Enum.Font.SourceSansBold; Info.TextSize = 14
    task.spawn(function()
        while task.wait(1) do
            local fps = math.floor(1/rs.RenderStepped:Wait())
            local ping = tonumber(string.format("%.0f", p:GetNetworkPing() * 1000))
            Info.Text = "FPS: "..fps.." | PING: "..ping.."ms"
        end
    end)

    -- КНОПКА DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 130, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", Side)
    local SideList = Instance.new("UIListLayout", Side); SideList.Padding = UDim.new(0, 5); SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local Pages = {}
    local function CreateP(name, vis)
        local f = Instance.new("ScrollingFrame", M); f.Size = UDim2.new(1, -145, 1, -40); f.Position = UDim2.new(0, 135, 0, 10); f.BackgroundTransparency = 1; f.Visible = vis; f.CanvasSize = UDim2.new(0, 0, 25, 0); f.ScrollBarThickness = 2
        Instance.new("UIListLayout", f).Padding = UDim.new(0, 5); Pages[name] = f; return f
    end
    local P1 = CreateP("Scripts", true); local P2 = CreateP("MyHub", false); local P3 = CreateP("Tsunami", false)

    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 120, 0, 45); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 8; b.TextWrapped = true; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for n, pge in pairs(Pages) do pge.Visible = (n == target) end end)
    end
    AddTab("SCRIPTS", "Scripts"); AddTab("MY HUB", "MyHub"); AddTab("SCRIPT ESCAPE TSUNAMI FOR BRAIROT", "Tsunami")

    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 13; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- ВКЛАДКА 1: ВСЕ 10 SCRIPTS (ВОЗВРАТ)
    local function s(n, u) AddB(P1, n, Color3.fromRGB(20,20,20), function() loadstring(game:HttpGet(u))() end) end
    s("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    s("2. Be a Lucky Block (FIXED)", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeALuckyBlock")
    s("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    s("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    s("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    s("6. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
    s("7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
    s("8. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("9. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    s("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")

    -- ВКЛАДКА 2: MY HUB (ОПЦИИ + НИКИ)
    AddB(P2, "--- SPECTATE ---", Color3.fromRGB(150,0,0), function() end)
    AddB(P2, "STOP WATCHING", Color3.fromRGB(200,0,0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(P2, "WATCH: "..v.DisplayName, Color3.fromRGB(30,30,30), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end
    AddB(P2, "--- OPTIONS ---", Color3.fromRGB(100,0,0), function() end)
    AddB(P2, "SPEED 100", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.WalkSpeed = 100 end)
    AddB(P2, "JUMP 150", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.JumpPower = 150 end)
    AddB(P2, "FULL BRIGHT", Color3.fromRGB(40,40,40), function() game:GetService("Lighting").Brightness = 2; game:GetService("Lighting").ClockTime = 14 end)
    AddB(P2, "INF JUMP (ON)", Color3.fromRGB(40,40,40), function() _G.Toggles.InfJump = true; game:GetService("UserInputService").JumpRequest:Connect(function() if _G.Toggles.InfJump then p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end) end)
    AddB(P2, "INF JUMP (OFF)", Color3.fromRGB(40,40,40), function() _G.Toggles.InfJump = false end)
    AddB(P2, "REJOIN", Color3.fromRGB(40,40,40), function() game:GetService("TeleportService"):Teleport(game.PlaceId, p) end)
    AddB(P2, "FPS BOOSTER", Color3.fromRGB(40,40,40), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FPSBooster"))() end)

    -- ВКЛАДКА 3: TSUNAMI MEGA LOADERS
    AddB(P3, "1. MYSTRIX HUB 🔥", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB(P3, "2. AUTO-FARM", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
    AddB(P3, "3. GOD MODE", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/TsunamiGodMode"))() end)
    AddB(P3, "4. ITEM COLLECT", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/TsunamiItems"))() end)
    AddB(P3, "5. SPEED & JUMP", Color3.fromRGB(0,50,100), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/TsunamiSpeed"))() end)
end

CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
