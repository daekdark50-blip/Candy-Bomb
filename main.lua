-- [[ CANDY-BOMB HUB: ULTIMATE RAGE EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- ПЕРЕМЕННЫЕ ДЛЯ ГЛОБАЛЬНЫХ РЕЖИМОВ
_G.Aimbot = false
_G.RainbowTool = false
_G.SpinFling = false
_G.Invisible = false

-- Создание основного интерфейса
local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 480, 0, 400); M.Position = UDim2.new(0.5, -240, 0.5, -200); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- КНОПКА DH (ОТКРЫТЬ/ЗАКРЫТЬ)
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 100, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(5, 5, 5); Instance.new("UICorner", Side)
    local SideList = Instance.new("UIListLayout", Side); SideList.Padding = UDim.new(0, 5); SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- ОКНА СТРАНИЦ
    local PageScripts = Instance.new("ScrollingFrame", M); PageScripts.Size = UDim2.new(1, -110, 1, -20); PageScripts.Position = UDim2.new(0, 105, 0, 10); PageScripts.BackgroundTransparency = 1; PageScripts.Visible = true; PageScripts.CanvasSize = UDim2.new(0, 0, 18, 0); PageScripts.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageScripts).Padding = UDim.new(0, 5)

    local PageMyHub = Instance.new("ScrollingFrame", M); PageMyHub.Size = UDim2.new(1, -110, 1, -20); PageMyHub.Position = UDim2.new(0, 105, 0, 10); PageMyHub.BackgroundTransparency = 1; PageMyHub.Visible = false; PageMyHub.CanvasSize = UDim2.new(0, 0, 12, 0); PageMyHub.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageMyHub).Padding = UDim.new(0, 5)

    -- КНОПКИ ПЕРЕКЛЮЧЕНИЯ ТАБОВ
    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 90, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 12; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() PageScripts.Visible = (target == "Scripts"); PageMyHub.Visible = (target == "MyHub") end)
    end
    AddTab("SCRIPTS", "Scripts")
    AddTab("MY HUB", "MyHub")

    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- [[[ ВКЛАДКА SCRIPTS: ВСЁ ТВОЁ СТАРОЕ ДОБРО ]]] --
    AddB(PageScripts, "--- SPECTATE (RESTORED) ---", Color3.new(0.4, 0, 0), function() end)
    AddB(PageScripts, "STOP WATCH (OFF)", Color3.fromRGB(200, 0, 0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(PageScripts, "WATCH: "..v.Name, Color3.fromRGB(40, 40, 40), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    AddB(PageScripts, "--- AUTO FARM ---", Color3.new(0, 0.3, 0.5), function() end)
    AddB(PageScripts, "Solix Hub (24H KEY) 🔥", Color3.fromRGB(120, 0, 255), function() 
        setclipboard("https://ads.luarmor.net/get_key?for=Solixhub_Free_KeySystem-OWlLHDMCHADk")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/a/a/a"))() 
    end)
    AddB(PageScripts, "Mystrix Hub", Color3.fromRGB(0, 80, 120), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)

    AddB(PageScripts, "--- TELEPORTS ---", Color3.new(0, 0.4, 0), function() end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(PageScripts, "TP: "..v.Name, Color3.fromRGB(30, 50, 30), function() p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) end) end
    end

    AddB(PageScripts, "--- 11 SCRIPTS ---", Color3.new(0.3, 0.3, 0.3), function() end)
    local function sc(n, u) AddB(PageScripts, n, Color3.fromRGB(35, 35, 35), function() loadstring(game:HttpGet(u))() end) end
    sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
    sc("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    sc("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    sc("5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
    sc("6. Trollz Hub V2", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
    sc("7. Remote Spy", "https://raw.githubusercontent.com/infyiff/remoteSpy/main/main.lua")
    sc("8. Z-Hub (Private)", "https://api.jnkie.com/api/v1/luascripts/public/1bdc51f71dbe6341881f5f1d3b1e018a30841cc093a770a03731c060e764a072/download")

    -- [[[ ВКЛАДКА MY HUB: ТВОЙ НОВЫЙ RAGE-ПАК ]]] --
    AddB(PageMyHub, "--- RAGE FUNCTIONS (C-Bomb) ---", Color3.fromRGB(200, 0, 0), function() end)

    -- 1. ESP (Надежный, с подсветкой)
    AddB(PageMyHub, "PLAYER ESP (High quality)", Color3.fromRGB(255, 100, 0), function()
        for _, pl in pairs(game.Players:GetPlayers()) do
            if pl ~= p and pl.Character and not pl.Character:FindFirstChild("C_ESP") then
                local h = Instance.new("Highlight", pl.Character)
                h.Name = "C_ESP"; h.FillColor = Color3.new(1, 0, 0); h.OutlineColor = Color3.new(1, 1, 1); h.FillTransparency = 0.5
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "ESP Включен!", Duration = 3})
    end)

    -- 2. AIM BOT (Silent Aim)
    AddB(PageMyHub, "Silent AIM (Tsunami Spec)", Color3.fromRGB(255, 100, 0), function()
        _G.Aimbot = not _G.Aimbot
        if _G.Aimbot then
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "AIMbot Включен!", Duration = 3})
            task.spawn(function()
                while _G.Aimbot do
                    for _, pl in pairs(game.Players:GetPlayers()) do
                        if pl ~= p and pl.Character and pl.Character:FindFirstChild("Head") then
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, pl.Character.Head.Position)
                            break -- Целимся в первого попавшегося
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "AIMbot Выключен!", Duration = 3})
        end
    end)

    -- 3. INVISIBLE (Скрипт для Tsunami)
    AddB(PageMyHub, "INVISIBLE MODE (Ghost)", Color3.fromRGB(255, 100, 0), function()
        _G.Invisible = not _G.Invisible
        if _G.Invisible then
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Ты невидим!", Duration = 3})
            p.Character.Head.Transparency = 1; p.Character.UpperTorso.Transparency = 1; p.Character.LowerTorso.Transparency = 1; p.Character.LeftUpperArm.Transparency = 1; p.Character.RightUpperArm.Transparency = 1; p.Character.LeftLowerArm.Transparency = 1; p.Character.RightLowerArm.Transparency = 1; p.Character.LeftUpperLeg.Transparency = 1; p.Character.RightUpperLeg.Transparency = 1; p.Character.LeftLowerLeg.Transparency = 1; p.Character.RightLowerLeg.Transparency = 1; p.Character.Face:Destroy()
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Ты снова виден!", Duration = 3})
            p.Character.Head.Transparency = 0 -- Просто делаем голову видимой, лицо не вернем без ресета
        end
    end)

    AddB(PageMyHub, "--- RAGE FUNCTIONS 2 ---", Color3.fromRGB(200, 0, 0), function() end)

    -- 4. RAINBOW TOOLS (Все инструменты переливаются)
    AddB(PageMyHub, "RAINBOW TOOLS (Vfx)", Color3.fromRGB(120, 0, 255), function()
        _G.RainbowTool = not _G.RainbowTool
        if _G.RainbowTool then
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Радужные инструменты!", Duration = 3})
            task.spawn(function()
                while _G.RainbowTool do
                    for _, v in pairs(p.Backpack:GetChildren()) do
                        if v:IsA("Tool") then
                            local c = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            for _, x in pairs(v:GetDescendants()) do if x:IsA("Part") or x:IsA("MeshPart") then x.Color = c end end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Радуга Выключена!", Duration = 3})
        end
    end)

    -- 5. SPIN SPEED FLING (Крутись и толкай)
    AddB(PageMyHub, "SPIN & FLING (Rage TP)", Color3.fromRGB(120, 0, 255), function()
        _G.SpinFling = not _G.SpinFling
        if _G.SpinFling then
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Крутись и Толкай!", Duration = 3})
            task.spawn(function()
                local char = p.Character; local hum = char.Humanoid
                while _G.SpinFling and char and hum.Parent do
                    for i = 1, 20 do char:SetPrimaryPartCFrame(char.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(30), 0)) task.wait() end
                    char.HumanoidRootPart.Velocity = Vector3.new(0,0,0) -- Стопаем скорость, чтобы не улететь самому
                    task.wait(0.1)
                end
            end)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "My Hub", Text = "Флинг Выключен!", Duration = 3})
        end
    end)

    -- Старые добрые скорость и телепорты
    AddB(PageMyHub, "--- UTILITIES ---", Color3.fromRGB(200, 0, 0), function() end)
    AddB(PageMyHub, "CANDY SPEED (80)", Color3.fromRGB(0, 200, 255), function() p.Character.Humanoid.WalkSpeed = 80 end)
end

CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
