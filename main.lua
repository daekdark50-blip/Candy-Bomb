-- [[ CANDY-BOMB: CUSTOM BLOODY LOADING UPDATE ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

-- Удаляем старое Гуи, если оно есть
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyLoading") then pg.CandyLoading:Destroy() end

-- 1. КАСТОМНАЯ КРОВАВАЯ ЗАГРУЗКА (МОЯ СОБСТВЕННАЯ)
local function StartLoading()
    local LG = Instance.new("ScreenGui", pg); LG.Name = "CandyLoading"
    local MainF = Instance.new("Frame", LG); MainF.Size = UDim2.new(1,0,1,0); MainF.BackgroundColor3 = Color3.new(0,0,0); MainF.ZIndex = 100
    
    -- Текст загрузки с эффектом крови
    local txt = Instance.new("TextLabel", MainF); txt.Size = UDim2.new(0,500,0,70); txt.Position = UDim2.new(0.5,-250,0.4,0); txt.Text = "CANDY-BOMB LOADING..."; txt.TextColor3 = Color3.fromRGB(130, 0, 0); txt.Font = Enum.Font.SourceSansBold; txt.TextSize = 55; txt.BackgroundTransparency = 1
    local glow = Instance.new("TextLabel", MainF); glow.Size = txt.Size; glow.Position = txt.Position; glow.Text = txt.Text; glow.TextColor3 = Color3.fromRGB(255, 0, 0); glow.Font = txt.Font; glow.TextSize = txt.TextSize + 2; glow.BackgroundTransparency = 1; glow.TextTransparency = 0.6; glow.ZIndex = txt.ZIndex - 1
    
    -- Мрачная полоса прогресса
    local barBG = Instance.new("Frame", MainF); barBG.Size = UDim2.new(0,400,0,12); barBG.Position = UDim2.new(0.5,-200,0.55,0); barBG.BackgroundColor3 = Color3.fromRGB(25,0,0); barBG.BorderSizePixel = 0; Instance.new("UICorner", barBG)
    local barFill = Instance.new("Frame", barBG); barFill.Size = UDim2.new(0,0,1,0); barFill.BackgroundColor3 = Color3.fromRGB(180,0,0); barFill.BorderSizePixel = 0; Instance.new("UICorner", barFill)
    local barGlow = Instance.new("Frame", barFill); barGlow.Size = UDim2.new(1,0,1,0); barGlow.BackgroundColor3 = Color3.fromRGB(255,0,0); barGlow.BackgroundTransparency = 0.5; barGlow.BorderSizePixel = 0; Instance.new("UICorner", barGlow)
    
    -- Анимация ползунка (4 секунды)
    local tw = ts:Create(barFill, TweenInfo.new(4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,1,0)})
    tw:Play()
    
    -- Убираем загрузку и запускаем хаб
    tw.Completed:Connect(function() 
        task.wait(0.3)
        LG:Destroy()
        CreateCandyHub() 
    end)
end

function CreateCandyHub()
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 560, 0, 460); M.Position = UDim2.new(0.5, -280, 0.5, -220); M.BackgroundColor3 = Color3.new(0,0,0); M.Active = true; Instance.new("UICorner", M)

    -- Перетаскивание меню (Draggable)
    local dS, sP, dG; M.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dG = true; dS = i.Position; sP = M.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dG = false end end) end end)
    uis.InputChanged:Connect(function(i) if dG and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - dS; M.Position = UDim2.new(sP.X.Scale, sP.X.Offset + d.X, sP.Y.Scale, sP.Y.Offset + d.Y) end end)

    -- Кнопка DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, -25); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(200,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 145, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", Side)
    local Pages = {}
    local function CreateP(name, vis)
        local f = Instance.new("ScrollingFrame", M); f.Size = UDim2.new(1, -160, 1, -20); f.Position = UDim2.new(0, 150, 0, 10); f.BackgroundTransparency = 1; f.Visible = vis; f.CanvasSize = UDim2.new(0, 0, 15, 0); f.ScrollBarThickness = 2
        Instance.new("UIListLayout", f).Padding = UDim.new(0, 5); Pages[name] = f; return f
    end
    
    local P1 = CreateP("Scripts", true); local P2 = CreateP("MyHub", false); local P3 = CreateP("AutoFarm", false)

    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 135, 0, 45); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 10; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for n, pge in pairs(Pages) do pge.Visible = (n == target) end end)
    end
    
    -- Вкладки
    AddTab("1. SCRIPT GAME", "Scripts"); AddTab("2. MY HUB", "MyHub"); AddTab("3. AUTO FARM", "AutoFarm")

    local function AddB(pnt, txt, clr, cb)
        local b = Instance.new("TextButton", pnt); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 12; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
        return b
    end

    -- ВКЛАДКА 1: 11 СКРИПТОВ (SCRIPT GAME)
    local function s(n, u) AddB(P1, n, Color3.fromRGB(30,30,30), function() loadstring(game:HttpGet(u))() end) end
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

    -- ВКЛАДКА 2: 20 ФУНКЦИЙ (MY HUB) С ПЕРЕКЛЮЧАТЕЛЯМИ
    AddB(P2, "-- STATS --", Color3.fromRGB(150,0,0))
    AddB(P2, "CHECK FPS", Color3.fromRGB(40,40,40), function() game:GetService("StarterGui"):SetCore("SendNotification", {Title="FPS", Text=tostring(math.floor(1/rs.RenderStepped:Wait()))}) end)
    AddB(P2, "CHECK PING", Color3.fromRGB(40,40,40), function() game:GetService("StarterGui"):SetCore("SendNotification", {Title="Ping", Text=math.floor(p:GetNetworkPing()*1000).."ms"}) end)
    
    AddB(P2, "-- MOVEMENT --", Color3.fromRGB(150,0,0))
    AddB(P2, "SPEED 150", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.WalkSpeed = 150 end)
    AddB(P2, "JUMP 250", Color3.fromRGB(40,40,40), function() p.Character.Humanoid.JumpPower = 250 end)
    
    -- Кнопки с ON/OFF
    local ij_on = false; local ijb = AddB(P2, "INF JUMP: OFF", Color3.fromRGB(80,0,0), function() 
        ij_on = not ij_on; ijb.Text = "INF JUMP: "..(ij_on and "ON" or "OFF"); ijb.BackgroundColor3 = (ij_on and Color3.fromRGB(0,100,0) or Color3.fromRGB(80,0,0))
    end); uis.JumpRequest:Connect(function() if ij_on then p.Character.Humanoid:ChangeState("Jumping") end end)

    local nc_on = false; local ncb = AddB(P2, "NOCLIP: OFF", Color3.fromRGB(80,0,0), function() 
        nc_on = not nc_on; ncb.Text = "NOCLIP: "..(nc_on and "ON" or "OFF"); ncb.BackgroundColor3 = (nc_on and Color3.fromRGB(0,100,0) or Color3.fromRGB(80,0,0))
    end); rs.Stepped:Connect(function() if nc_on then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end)

    AddB(P2, "-- SERVER & UTILS --", Color3.fromRGB(150,0,0))
    AddB(P2, "SERVER HOP", Color3.fromRGB(40,40,40), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EmperorsHacks/ServerHop/main/ServerHop.lua"))() end)
    AddB(P2, "REJOIN", Color3.fromRGB(40,40,40), function() game:GetService("TeleportService"):Teleport(game.PlaceId, p) end)
    AddB(P2, "RESPAWN", Color3.fromRGB(40,40,40), function() p.Character:BreakJoints() end)
    
    AddB(P2, "ANTI-AFK (ON)", Color3.fromRGB(0,100,0), function() p.Idled:Connect(function() game:GetService("VirtualUser"):CaptureController(); game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end) end)
    AddB(P2, "STOP WATCHING", Color3.fromRGB(120,0,0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(P2, "WATCH: "..v.DisplayName, Color3.fromRGB(30,30,30), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    -- ВКЛАДКА 3: AUTO FARM
    AddB(P3, "MYSTRIX HUB 🔥", Color3.fromRGB(0,50,150), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB(P3, "AUTO FARM (TSUNAMI)", Color3.fromRGB(0,50,150), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
end

StartLoading()
