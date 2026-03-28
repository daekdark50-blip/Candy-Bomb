-- [[ CANDY-BOMB: THE PERFECT BUILD ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

-- Чистка старых интерфейсов
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyLoading") then pg.CandyLoading:Destroy() end

-- 1. ТВОЯ СОБСТВЕННАЯ КРОВАВАЯ ЗАГРУЗКА
local function StartLoading()
    local LG = Instance.new("ScreenGui", pg); LG.Name = "CandyLoading"
    local MainF = Instance.new("Frame", LG); MainF.Size = UDim2.new(1,0,1,0); MainF.BackgroundColor3 = Color3.new(0,0,0); MainF.ZIndex = 100
    
    local txt = Instance.new("TextLabel", MainF); txt.Size = UDim2.new(0,500,0,70); txt.Position = UDim2.new(0.5,-250,0.4,0); txt.Text = "LOADING WORK..."; txt.TextColor3 = Color3.fromRGB(130, 0, 0); txt.Font = Enum.Font.SourceSansBold; txt.TextSize = 55; txt.BackgroundTransparency = 1
    
    local barBG = Instance.new("Frame", MainF); barBG.Size = UDim2.new(0,400,0,10); barBG.Position = UDim2.new(0.5,-200,0.55,0); barBG.BackgroundColor3 = Color3.fromRGB(30,0,0); barBG.BorderSizePixel = 0; Instance.new("UICorner", barBG)
    local barFill = Instance.new("Frame", barBG); barFill.Size = UDim2.new(0,0,1,0); barFill.BackgroundColor3 = Color3.fromRGB(180,0,0); barFill.BorderSizePixel = 0; Instance.new("UICorner", barFill)
    
    local tw = ts:Create(barFill, TweenInfo.new(4, Enum.EasingStyle.Quart), {Size = UDim2.new(1,0,1,0)})
    tw:Play()
    tw.Completed:Connect(function() 
        task.wait(0.3); LG:Destroy(); CreateCandyHub() 
    end)
end

function CreateCandyHub()
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 560, 0, 460); M.Position = UDim2.new(0.5, -280, 0.5, -230); M.BackgroundColor3 = Color3.new(0,0,0); M.Active = true; Instance.new("UICorner", M)

    -- Перетаскивание меню
    local dS, sP, dG; M.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dG = true; dS = i.Position; sP = M.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dG = false end end) end end)
    uis.InputChanged:Connect(function(i) if dG and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - dS; M.Position = UDim2.new(sP.X.Scale, sP.X.Offset + d.X, sP.Y.Scale, sP.Y.Offset + d.Y) end end)

    -- Кнопка открытия DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, -25); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(180,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 150, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", Side)
    local Pages = {}
    local function CreateP(name, vis)
        local f = Instance.new("ScrollingFrame", M); f.Size = UDim2.new(1, -165, 1, -20); f.Position = UDim2.new(0, 155, 0, 10); f.BackgroundTransparency = 1; f.Visible = vis; f.CanvasSize = UDim2.new(0, 0, 0, 1200); f.ScrollBarThickness = 3
        Instance.new("UIListLayout", f).Padding = UDim.new(0, 8); Pages[name] = f; return f
    end
    
    local P1 = CreateP("Scripts", true); local P2 = CreateP("MyHub", false); local P3 = CreateP("AutoFarm", false)

    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(1, -10, 0, 45); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 11; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for n, pge in pairs(Pages) do pge.Visible = (n == target) end end)
    end
    
    -- Твои 3 вкладки
    AddTab("1. SCRIPT GAME", "Scripts"); AddTab("2. MY HUB", "MyHub"); AddTab("3. AUTO FARM", "AutoFarm")

    local function AddB(pnt, txt, clr, cb)
        local b = Instance.new("TextButton", pnt); b.Size = UDim2.new(1, -10, 0, 40); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 13; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb); return b
    end

    -- Вкладка 1: 11 СКРИПТОВ
    local function s(n, u) AddB(P1, n, Color3.fromRGB(35,35,35), function() loadstring(game:HttpGet(u))() end) end
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

    -- Вкладка 2: MY HUB (20 ФУНКЦИЙ)
    for i=1, 20 do
        local on = false
        local b; b = AddB(P2, "FUNCTION "..i..": OFF", Color3.fromRGB(80,0,0), function()
            on = not on; b.Text = "FUNCTION "..i..": "..(on and "ON" or "OFF")
            b.BackgroundColor3 = (on and Color3.fromRGB(0,100,0) or Color3.fromRGB(80,0,0))
        end)
    end

    -- Вкладка 3: AUTO FARM (ПРАВИЛЬНЫЙ ПОРЯДОК)
    AddB(P3, "1. ITEM COLLECTOR", Color3.fromRGB(0, 80, 200), function() 
        for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0) end end 
    end)
    AddB(P3, "2. GOD MODE", Color3.fromRGB(0, 80, 200), function() p.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false) end)
    AddB(P3, "--------------------------", Color3.fromRGB(40, 40, 40), function() end)
    
    -- В самом низу
    AddB(P3, "🔥 MY HUB (MYSTRIX)", Color3.fromRGB(150, 0, 0), function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() 
    end)
    AddB(P3, "🌊 TSUNAMI FOR BRAIROT", Color3.fromRGB(0, 120, 200), function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() 
    end)
end

StartLoading()
