-- [[ CANDY-BOMB: FULLSCREEN ULTIMATE EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

-- Удаляем старое
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyLoading") then pg.CandyLoading:Destroy() end

-- 1. ТВОЯ ИКОНКА И ЗАГРУЗКА (КРОВАВАЯ ПОЛОСКА)
local function StartLoading()
    local LG = Instance.new("ScreenGui", pg); LG.Name = "CandyLoading"
    local MainF = Instance.new("Frame", LG); MainF.Size = UDim2.new(1,0,1,0); MainF.BackgroundColor3 = Color3.new(0,0,0); MainF.ZIndex = 100
    
    -- Твоя иконка в центре (логотип DH)
    local logo = Instance.new("TextLabel", MainF); logo.Size = UDim2.new(0,200,0,200); logo.Position = UDim2.new(0.5,-100,0.3,0); logo.Text = "DH"; logo.TextColor3 = Color3.fromRGB(200,0,0); logo.Font = Enum.Font.SourceSansBold; logo.TextSize = 120; logo.BackgroundTransparency = 1
    
    local txt = Instance.new("TextLabel", MainF); txt.Size = UDim2.new(0,500,0,50); txt.Position = UDim2.new(0.5,-250,0.55,0); txt.Text = "LOADING WORK..."; txt.TextColor3 = Color3.fromRGB(150, 0, 0); txt.Font = Enum.Font.SourceSansBold; txt.TextSize = 40; txt.BackgroundTransparency = 1
    
    local barBG = Instance.new("Frame", MainF); barBG.Size = UDim2.new(0,400,0,8); barBG.Position = UDim2.new(0.5,-200,0.65,0); barBG.BackgroundColor3 = Color3.fromRGB(35,0,0); barBG.BorderSizePixel = 0; Instance.new("UICorner", barBG)
    local barFill = Instance.new("Frame", barBG); barFill.Size = UDim2.new(0,0,1,0); barFill.BackgroundColor3 = Color3.fromRGB(200,0,0); barFill.BorderSizePixel = 0; Instance.new("UICorner", barFill)
    
    local tw = ts:Create(barFill, TweenInfo.new(4), {Size = UDim2.new(1,0,1,0)})
    tw:Play(); tw.Completed:Connect(function() task.wait(0.2); LG:Destroy(); CreateCandyHub() end)
end

-- 2. ГЛАВНЫЙ ХАБ НА ВЕСЬ ЭКРАН
function CreateCandyHub()
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    
    -- Фрейм на весь экран (fullscreen)
    local M = Instance.new("Frame", G); M.Size = UDim2.new(1, 0, 1, 0); M.BackgroundColor3 = Color3.new(0,0,0); M.BackgroundTransparency = 0.1; M.Visible = true
    
    -- Кнопка сворачивания (DH)
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 20, 0.5, -30); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(200,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 25; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- Список со скроллом
    local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(0.6, 0, 0.85, 0); Scroll.Position = UDim2.new(0.2, 0, 0.1, 0); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0, 0, 0, 3000); Scroll.ScrollBarThickness = 5
    Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 10)

    -- Заголовок
    local title = Instance.new("TextLabel", M); title.Size = UDim2.new(1,0,0,60); title.Text = "CANDY BOMB V.42 - TOTAL LIST"; title.TextColor3 = Color3.fromRGB(200,0,0); title.Font = Enum.Font.SourceSansBold; title.TextSize = 35; title.BackgroundTransparency = 1

    local function AddB(txt, clr, cb)
        local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, -20, 0, 50); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 18; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb); return b
    end

    local function AddTitle(txt)
        local t = Instance.new("TextLabel", Scroll); t.Size = UDim2.new(1,0,0,40); t.Text = "--- "..txt.." ---"; t.TextColor3 = Color3.fromRGB(255,255,255); t.Font = Enum.Font.SourceSansBold; t.TextSize = 20; t.BackgroundTransparency = 1
    end

    -- РАЗДЕЛ 1: 11 СКРИПТОВ
    AddTitle("11 MAIN SCRIPTS")
    local function s(n, u) AddB(n, Color3.fromRGB(30,30,30), function() loadstring(game:HttpGet(u))() end) end
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
    s("11. Infinite Yield (Admin)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

    -- РАЗДЕЛ 2: MY HUB (20 ФУНКЦИЙ С ВКЛ/ВЫКЛ)
    AddTitle("MY HUB: 20 FUNCTIONS")
    for i=1, 20 do
        local on = false
        local b; b = AddB("FUNCTION "..i..": OFF", Color3.fromRGB(100,0,0), function()
            on = not on; b.Text = "FUNCTION "..i..": "..(on and "ON" or "OFF")
            b.BackgroundColor3 = (on and Color3.fromRGB(0,120,0) or Color3.fromRGB(100,0,0))
        end)
    end

    -- РАЗДЕЛ 3: AUTO FARM (В САМЫЙ НИЗ)
    AddTitle("AUTO FARM & UTILS")
    AddB("🔥 MYSTRIX HUB", Color3.fromRGB(0, 80, 200), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB("🌊 AUTO FARM BRAINROTS", Color3.fromRGB(0, 80, 200), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
    AddB("📦 AUTO COLLECTOR", Color3.fromRGB(0, 80, 200), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0) end end end)
    AddB("👁️ ESP / WH", Color3.fromRGB(0, 80, 200), function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHub.lua'))() end)
end

StartLoading()
