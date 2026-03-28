-- [[ CANDY-BOMB: TOTAL ONE-LIST EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyLoading") then pg.CandyLoading:Destroy() end

-- 1. ТВОЯ ЗАГРУЗКА
local function StartLoading()
    local LG = Instance.new("ScreenGui", pg); LG.Name = "CandyLoading"
    local MainF = Instance.new("Frame", LG); MainF.Size = UDim2.new(1,0,1,0); MainF.BackgroundColor3 = Color3.new(0,0,0); MainF.ZIndex = 100
    local txt = Instance.new("TextLabel", MainF); txt.Size = UDim2.new(0,500,0,70); txt.Position = UDim2.new(0.5,-250,0.4,0); txt.Text = "LOADING WORK..."; txt.TextColor3 = Color3.fromRGB(150, 0, 0); txt.Font = Enum.Font.SourceSansBold; txt.TextSize = 55; txt.BackgroundTransparency = 1
    local barBG = Instance.new("Frame", MainF); barBG.Size = UDim2.new(0,400,0,10); barBG.Position = UDim2.new(0.5,-200,0.55,0); barBG.BackgroundColor3 = Color3.fromRGB(35,0,0); barBG.BorderSizePixel = 0; Instance.new("UICorner", barBG)
    local barFill = Instance.new("Frame", barBG); barFill.Size = UDim2.new(0,0,1,0); barFill.BackgroundColor3 = Color3.fromRGB(200,0,0); barFill.BorderSizePixel = 0; Instance.new("UICorner", barFill)
    local tw = ts:Create(barFill, TweenInfo.new(4), {Size = UDim2.new(1,0,1,0)})
    tw:Play(); tw.Completed:Connect(function() task.wait(0.2); LG:Destroy(); CreateCandyHub() end)
end

function CreateCandyHub()
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 560, 0, 460); M.Position = UDim2.new(0.5, -280, 0.5, -230); M.BackgroundColor3 = Color3.new(0,0,0); M.Active = true; Instance.new("UICorner", M)

    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, -25); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(200,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 22; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- ОДНА ГЛАВНАЯ ПАНЕЛЬ СО СКРОЛЛОМ
    local MainScroll = Instance.new("ScrollingFrame", M)
    MainScroll.Size = UDim2.new(1, -20, 1, -20); MainScroll.Position = UDim2.new(0, 10, 0, 10); MainScroll.BackgroundTransparency = 1
    MainScroll.CanvasSize = UDim2.new(0, 0, 0, 2500); MainScroll.ScrollBarThickness = 4
    local layout = Instance.new("UIListLayout", MainScroll); layout.Padding = UDim.new(0, 5)

    local function AddB(txt, clr, cb)
        local b = Instance.new("TextButton", MainScroll); b.Size = UDim2.new(1, -10, 0, 40); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb); return b
    end

    -- ЧАСТЬ 1: 11 СКРИПТОВ
    local function s(n, u) AddB(n, Color3.fromRGB(40,40,40), function() loadstring(game:HttpGet(u))() end) end
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

    -- ЧАСТЬ 2: MY HUB (ПОСЛЕ INF YIELD)
    AddB("--- MY HUB (20 FUNCTIONS) ---", Color3.fromRGB(150, 0, 0), function() end)
    for i=1, 20 do
        local st = false
        local b; b = AddB("FUNCTION "..i..": OFF", Color3.fromRGB(80,0,0), function()
            st = not st; b.Text = "FUNCTION "..i..": "..(st and "ON" or "OFF")
            b.BackgroundColor3 = (st and Color3.fromRGB(0,100,0) or Color3.fromRGB(80,0,0))
        end)
    end

    -- ЧАСТЬ 3: AUTO FARM (В САМЫЙ НИЗ)
    AddB("--- AUTO FARM SECTION ---", Color3.fromRGB(0, 80, 150), function() end)
    AddB("🔥 MYSTRIX HUB", Color3.fromRGB(0, 100, 200), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)
    AddB("🌊 AUTO FARM BRAINROTS", Color3.fromRGB(0, 100, 200), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta"))() end)
    AddB("📦 AUTO COLLECTOR", Color3.fromRGB(0, 100, 200), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(p.Character.HumanoidRootPart, v.Parent, 0) end end end)
    AddB("👁️ ESP / WH", Color3.fromRGB(0, 100, 200), function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHub.lua'))() end)
    AddB("⚡ SPEED FARM", Color3.fromRGB(0, 100, 200), function() p.Character.Humanoid.WalkSpeed = 100 end)
end

StartLoading()
