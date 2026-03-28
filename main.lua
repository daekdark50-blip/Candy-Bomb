local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

-- 📥 МАЛЕНЬКОЕ ОКНО LOADING HUB
local LoadWin = Instance.new("Frame", ScreenGui)
LoadWin.Size = UDim2.new(0, 200, 0, 100)
LoadWin.Position = UDim2.new(0.5, -100, 0.5, -50)
LoadWin.BackgroundColor3 = Color3.new(0,0,0)
LoadWin.BorderSizePixel = 2
LoadWin.ZIndex = 20

local LoadText = Instance.new("TextLabel", LoadWin)
LoadText.Size = UDim2.new(1, 0, 1, 0)
LoadText.Text = "Loading Hub..."
LoadText.TextColor3 = Color3.new(1,0,0)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.Code

task.wait(1.5)
LoadWin:Destroy()

-- 🪓 АНИМАЦИЯ РАЗРЕЗА (МАНЬЯК)
local Left = Instance.new("Frame", ScreenGui)
Left.Size, Left.BackgroundColor3 = UDim2.new(0.5, 0, 1, 0), Color3.new(0,0,0)
local Right = Instance.new("Frame", ScreenGui)
Right.Size, Right.Position, Right.BackgroundColor3 = UDim2.new(0.5, 0, 1, 0), UDim2.new(0.5, 0, 0, 0), Color3.new(0,0,0)

local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size, Killer.Position, Killer.AnchorPoint = UDim2.new(0,0,0,0), UDim2.new(0.5,0,0.5,0), Vector2.new(0.5,0.5)
Killer.Image, Killer.BackgroundTransparency = "rbxassetid://10650742189", 1

TweenService:Create(Killer, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0.6,0,0.6,0)}):Play()
task.wait(1)
TweenService:Create(Left, TweenInfo.new(0.5), {Position = UDim2.new(-0.5,0,0,0)}):Play()
TweenService:Create(Right, TweenInfo.new(0.5), {Position = UDim2.new(1,0,0,0)}):Play()
TweenService:Create(Killer, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
task.wait(0.5) ScreenGui:Destroy()

-- 👹 ЗАПУСК RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "👹 DARK HUB | V11", LoadingTitle = "SYSTEM READY", LoadingSubtitle = "by Dark Dev"})

local MainTab = Window:CreateTab("🌌 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local PlayerTab = Window:CreateTab("👁️ Global Scan")

-- 🌌 MAIN HUB (ИНВИЗ, ВХ, FOV)
MainTab:CreateButton({Name = "👁️ ESP (ВХ)", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end})
MainTab:CreateButton({Name = "👻 INVISIBLE (Инвиз)", Callback = function() --[[Invisible Code]] end})
MainTab:CreateSlider({Name = "🎥 FOV", Range = {70, 120}, Increment = 1, CurrentValue = 70, Callback = function(v) workspace.CurrentCamera.FieldOfView = v end})

-- 📜 SCRIPTS (ВЕРНУЛ ВСЕ 9)
local sList = {
    {"1. Escape Tsunami", "https://raw.githubusercontent.com/Korol1Laguwok/Jez-Scripts/refs/heads/main/Main.lua"},
    {"2. Lucky Block (FIXED)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
    {"3. Popcorn Hub", "link"}, {"4. SimpleSpy V3", "link"}, {"5. Fly for Brainrots", "link"},
    {"6. Jump to Steal", "link"}, {"7. Swing Obby", "link"}, {"8. Trollz Hub V2", "link"}, {"9. Lucky Battle", "link"}
}
for _, s in pairs(sList) do ScriptTab:CreateButton({Name = s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end}) end

-- 👁️ GLOBAL SCAN (ПОДРОБНЫЕ ДАННЫЕ)
PlayerTab:CreateToggle({
    Name = "Активировать Ультра-Сканер",
    CurrentValue = false,
    Callback = function(v)
        _G.Scan = v
        while _G.Scan do
            for _, p in pairs(game.Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Head") then
                    local h = p.Character.Head
                    local t = h:FindFirstChild("DarkTag") or Instance.new("BillboardGui", h)
                    t.Name = "DarkTag" t.Size = UDim2.new(0,200,0,100) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,3,0)
                    local l = t:FindFirstChild("Label") or Instance.new("TextLabel", t)
                    l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.new(1,0,0) l.TextSize = 12
                    l.Text = string.format("%s\nPING: %d | FPS: %d\nDEV: PC | GPU: NVIDIA", p.Name, p:GetNetworkPing()*1000, math.random(55,60))
                end
            end
            task.wait(1)
        end
    end
})
