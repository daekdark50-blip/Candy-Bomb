-- [[ CANDY-BOMB HUB: BLACK SPY EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

_G.RainbowSkin = false
_G.Noclip = false
_G.SpinFling = false

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 480, 0, 420); M.Position = UDim2.new(0.5, -240, 0.5, -210); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- КНОПКА DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 100, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", Side)
    local SideList = Instance.new("UIListLayout", Side); SideList.Padding = UDim.new(0, 5); SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- КОНТЕЙНЕРЫ СТРАНИЦ
    local PageScripts = Instance.new("ScrollingFrame", M); PageScripts.Size = UDim2.new(1, -110, 1, -20); PageScripts.Position = UDim2.new(0, 105, 0, 10); PageScripts.BackgroundTransparency = 1; PageScripts.Visible = true; PageScripts.CanvasSize = UDim2.new(0, 0, 18, 0); PageScripts.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageScripts).Padding = UDim.new(0, 5)

    local PageMyHub = Instance.new("ScrollingFrame", M); PageMyHub.Size = UDim2.new(1, -110, 1, -20); PageMyHub.Position = UDim2.new(0, 105, 0, 10); PageMyHub.BackgroundTransparency = 1; PageMyHub.Visible = false; PageMyHub.CanvasSize = UDim2.new(0, 0, 12, 0); PageMyHub.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageMyHub).Padding = UDim.new(0, 5)

    -- ВКЛАДКИ
    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 90, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(20, 20, 20); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 12; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() PageScripts.Visible = (target == "Scripts"); PageMyHub.Visible = (target == "MyHub") end)
    end
    AddTab("SCRIPTS", "Scripts")
    AddTab("MY HUB", "MyHub")

    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- [[ ВКЛАДКА SCRIPTS: ВСЕ 11 СКРИПТОВ ]] --
    AddB(PageScripts, "--- 11 SCRIPTS ---", Color3.fromRGB(40, 40, 40), function() end)
    local function sc(n, u) AddB(PageScripts, n, Color3.fromRGB(30, 30, 30), function() loadstring(game:HttpGet(u))() end) end
    sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
    sc("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    sc("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    sc("5. Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
    sc("6. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
    sc("7. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    sc("8. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    sc("9. Lucky Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    sc("10. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")
    sc("11. Z-Hub (Private)", "https://api.jnkie.com/api/v1/luascripts/public/1bdc51f71dbe6341881f5f1d3b1e018a30841cc093a770a03731c060e764a072/download")

    -- [[ ВКЛАДКА MY HUB: ESP & SPECTATE ]] --
    AddB(PageMyHub, "--- SPECTATE (WATCH) ---", Color3.fromRGB(150, 0, 0), function() end)
    AddB(PageMyHub, "STOP SPECTATE (OFF)", Color3.fromRGB(200, 0, 0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(PageMyHub, "WATCH: "..v.Name, Color3.fromRGB(30, 30, 30), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    AddB(PageMyHub, "--- SPY FUNCTIONS ---", Color3.fromRGB(150, 0, 0), function() end)
    
    -- ESP Tracker (Линии)
    AddB(PageMyHub, "ESP TRACKER (LINES)", Color3.fromRGB(50, 0, 0), function()
        for _, pl in pairs(game.Players:GetPlayers()) do
            if pl ~= p and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                local l = Instance.new("Beam", p.Character.HumanoidRootPart); l.Name = "Tracker"
                local a0 = Instance.new("Attachment", p.Character.HumanoidRootPart); local a1 = Instance.new("Attachment", pl.Character.HumanoidRootPart)
                l.Attachment0 = a0; l.Attachment1 = a1; l.Width0 = 0.1; l.Width1 = 0.1; l.FaceCamera = true; l.Color = ColorSequence.new(Color3.new(1,0,0))
            end
        end
    end)

    -- ESP Avatars
    AddB(PageMyHub, "ESP AVATARS", Color3.fromRGB(50, 0, 0), function()
        for _, pl in pairs(game.Players:GetPlayers()) do
            if pl ~= p and pl.Character and pl.Character:FindFirstChild("Head") then
                local b = Instance.new("BillboardGui", pl.Character.Head); b.Size = UDim2.new(0, 50, 0, 50); b.AlwaysOnTop = true; b.ExtentsOffset = Vector3.new(0, 3, 0)
                local i = Instance.new("ImageLabel", b); i.Size = UDim2.new(1, 0, 1, 0); i.Image = "rbxthumb://type=AvatarHeadShot&id="..pl.UserId.."&w=150&h=150"; i.BackgroundTransparency = 1
            end
        end
    end)

    AddB(PageMyHub, "CANDY SPEED (80)", Color3.fromRGB(50, 0, 0), function() p.Character.Humanoid.WalkSpeed = 80 end)
    AddB(PageMyHub, "FLY (ПОЛЕТ)", Color3.fromRGB(50, 0, 0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)

    -- RAINBOW SKIN
    AddB(PageMyHub, "RAINBOW SKIN", Color3.fromRGB(50, 0, 0), function()
        _G.RainbowSkin = not _G.RainbowSkin
        task.spawn(function()
            while _G.RainbowSkin do
                local c = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                for _, v in pairs(p.Character:GetChildren()) do if v:IsA("Part") or v:IsA("MeshPart") then v.Color = c end end
                task.wait(0.1)
            end
        end)
    end)

    -- SPIN FLING
    AddB(PageMyHub, "SPIN FLING", Color3.fromRGB(50, 0, 0), function()
        _G.SpinFling = not _G.SpinFling
        task.spawn(function()
            while _G.SpinFling do p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(50), 0) task.wait() end
        end)
    end)

    AddB(PageMyHub, "ZOOM CLICK", Color3.fromRGB(50, 0, 0), function() p.CameraMaxZoomDistance = 500 end)
    
    -- NOCLIP
    AddB(PageMyHub, "NOCLIP", Color3.fromRGB(50, 0, 0), function()
        _G.Noclip = not _G.Noclip
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Noclip then for _, v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        end)
    end)
end

CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
