-- [[ CANDY-BOMB HUB: ULTIMATE FINAL EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- Таблица состояний для кнопок (Вкл/Выкл)
_G.Toggles = {
    RainbowSkin = false,
    Noclip = false,
    SpinFling = false,
    ESP = false,
    Tracker = false,
    Avatars = false
}

local function CreateCandyHub()
    -- Удаляем старое меню, если оно есть
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

    -- ОСНОВНОЕ ОКНО (ЧЕРНОЕ)
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 520, 0, 420); M.Position = UDim2.new(0.5, -260, 0.5, -210); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- КНОПКА DH (ДЛЯ ПК И ТЕЛЕФОНА)
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ (ТАБЫ)
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 120, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", Side)
    local SideList = Instance.new("UIListLayout", Side); SideList.Padding = UDim.new(0, 5); SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- СОЗДАНИЕ СТРАНИЦ
    local Pages = {}
    local function CreatePage(name, visible)
        local frame = Instance.new("ScrollingFrame", M); frame.Size = UDim2.new(1, -130, 1, -20); frame.Position = UDim2.new(0, 125, 0, 10); frame.BackgroundTransparency = 1; frame.Visible = visible; frame.CanvasSize = UDim2.new(0, 0, 18, 0); frame.ScrollBarThickness = 2
        Instance.new("UIListLayout", frame).Padding = UDim.new(0, 5)
        Pages[name] = frame
        return frame
    end

    local P1 = CreatePage("Scripts", true)
    local P2 = CreatePage("MyHub", false)
    local P3 = CreatePage("Tsunami", false)

    -- КНОПКИ ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК
    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 110, 0, 45); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(20, 20, 20); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 10; b.TextWrapped = true; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function()
            for n, pge in pairs(Pages) do pge.Visible = (n == target) end
        end)
    end
    AddTab("SCRIPTS", "Scripts")
    AddTab("MY HUB", "MyHub")
    AddTab("SCRIPT ESCAPE TSUNAMI FOR BRAIROT", "Tsunami")

    -- ФУНКЦИЯ ДЛЯ КНОПОК С СИСТЕМОЙ ВКЛ/ВЫКЛ (ЧЕРНЕЮТ ПРИ НАЖАТИИ)
    local function AddToggleB(parent, txt, toggleName, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(35, 35, 35); b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b)
        
        local function updateUI()
            b.BackgroundColor3 = _G.Toggles[toggleName] and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(35, 35, 35)
            b.Text = txt .. (_G.Toggles[toggleName] and " [ON]" or " [OFF]")
            b.TextColor3 = _G.Toggles[toggleName] and Color3.new(0.5, 0.5, 0.5) or Color3.new(1, 1, 1)
        end

        b.MouseButton1Click:Connect(function()
            _G.Toggles[toggleName] = not _G.Toggles[toggleName]
            updateUI()
            cb(_G.Toggles[toggleName])
        end)
        updateUI()
    end

    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- [[ ВКЛАДКА 1: SCRIPTS (ВСЕ 11 СКРИПТОВ) ]] --
    AddB(P1, "--- 11 SCRIPTS ---", Color3.fromRGB(40, 40, 40), function() end)
    local function sc(n, u) AddB(P1, n, Color3.fromRGB(25, 25, 25), function() loadstring(game:HttpGet(u))() end) end
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

    -- [[ ВКЛАДКА 2: MY HUB (BLACK RAGE) ]] --
    AddB(P2, "--- SPECTATE (WATCH) ---", Color3.fromRGB(120, 0, 0), function() end)
    AddB(P2, "STOP WATCH (OFF)", Color3.fromRGB(180, 0, 0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(P2, "WATCH: "..v.Name, Color3.fromRGB(25, 25, 25), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    AddB(P2, "--- EXCLUSIVE FUNCTIONS ---", Color3.fromRGB(100, 0, 0), function() end)
    
    -- ВХ (ESP)
    AddToggleB(P2, "PLAYER ESP (ВХ)", "ESP", function(state)
        for _, pl in pairs(game.Players:GetPlayers()) do
            if pl ~= p and pl.Character then
                if state then
                    local h = Instance.new("Highlight", pl.Character); h.Name = "CH_ESP"; h.FillColor = Color3.new(1,0,0)
                else
                    if pl.Character:FindFirstChild("CH_ESP") then pl.Character.CH_ESP:Destroy() end
                end
            end
        end
    end)

    -- РАДУЖНАЯ КОЖА
    AddToggleB(P2, "RAINBOW SKIN", "RainbowSkin", function(state)
        task.spawn(function()
            while _G.Toggles.RainbowSkin do
                local c = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                for _, v in pairs(p.Character:GetChildren()) do if v:IsA("Part") or v:IsA("MeshPart") then v.Color = c end end
                task.wait(0.1)
            end
        end)
    end)

    -- КРУТИЛКА (FLING)
    AddToggleB(P2, "SPIN FLING", "SpinFling", function(state)
        task.spawn(function()
            while _G.Toggles.SpinFling do 
                p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(60), 0) 
                task.wait() 
            end
        end)
    end)

    -- НОКЛИП
    AddToggleB(P2, "NOCLIP (WALLS)", "Noclip", function(state)
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Toggles.Noclip then
                for _, v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
            end
        end)
    end)

    AddB(P2, "CANDY SPEED (80)", Color3.fromRGB(30, 30, 30), function() p.Character.Humanoid.WalkSpeed = 80 end)

    -- [[ ВКЛАДКА 3: SCRIPT ESCAPE TSUNAMI FOR BRAIROT ]] --
    AddB(P3, "--- MYSTRIX HUB FULL ---", Color3.fromRGB(0, 0, 120), function() end)
    AddB(P3, "LOAD MYSTRIX HUB 🔥", Color3.fromRGB(0, 40, 80), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))()
    end)
    AddB(P3, "LOAD SOLIX HUB (AF)", Color3.fromRGB(0, 40, 80), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/a/a/a"))()
    end)
end

-- Запуск
CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
