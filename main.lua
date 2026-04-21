-- [[ DARK PROJECT: МГНОВЕННЫЙ ЗАПУСК БЕЗ ЗАГРУЗКИ ]]
if not game:IsLoaded() then game.Loaded:Wait() end

-- 1. ТЕГ НАД ГОЛОВОЙ (DARK)
local function SetDarkTag()
    local p = game.Players.LocalPlayer
    local char = p.Character or p.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")
    if head:FindFirstChild("DarkTag") then head.DarkTag:Destroy() end
    local bg = Instance.new("BillboardGui", head)
    bg.Name = "DarkTag"
    bg.Size = UDim2.new(0, 200, 0, 50)
    bg.AlwaysOnTop = true
    bg.ExtentsOffset = Vector3.new(0, 3.5, 0)
    local tl = Instance.new("TextLabel", bg)
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.BackgroundTransparency = 1
    tl.Text = "🌀 CREATOR: DARK 🌀"
    tl.TextColor3 = Color3.fromRGB(255, 0, 0)
    tl.TextSize = 25
    tl.Font = Enum.Font.GothamBold
    tl.TextStrokeTransparency = 0
end
task.spawn(SetDarkTag)
game.Players.LocalPlayer.CharacterAdded:Connect(SetDarkTag)

-- 2. СРАЗУ ЗАПУСКАЕМ RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "🌑 DARK PROJECT v8.8",
    LoadingTitle = "DARK SYSTEM READY",
    LoadingSubtitle = "by Dark 🌀",
    ConfigurationSaving = {Enabled = false},
    Theme = "Rogue"
})

local MainTab = Window:CreateTab("Overdrive", 4483362458)
local RF_Hit = game:GetService("ReplicatedStorage").Packages.Knit.Services.EggSpawnerService.RF.RequestHitEgg
local RF_Collect = game:GetService("ReplicatedStorage").Packages.Knit.Services.BaseService.RF.RequestPlatformCollect

-- ТА САМАЯ МАШИНА
local function GetAbsoluteTargets()
    local targets = {}
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return targets end
    local area = workspace:GetPartBoundsInRadius(hrp.Position, 65)
    for _, part in pairs(area) do
        local model = part:FindFirstAncestorOfClass("Model")
        if model and not table.find(targets, model.Name) then
            if model.Parent.Name:find("Egg") or model.Parent.Name:find("Vault") or model.Parent.Name == "Eggs" then
                table.insert(targets, model.Name)
            end
        end
        if #targets >= 100 then break end
    end
    return targets
end

MainTab:CreateToggle({
   Name = "🔥 Auto Hit Eggs (MACHINE)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Hit = Value
       task.spawn(function()
           while _G.Hit do
               local list = GetAbsoluteTargets()
               if #list > 0 then pcall(function() RF_Hit:InvokeServer(list) end) end
               task.wait(0.04)
           end
       end)
   end,
})

MainTab:CreateToggle({
   Name = "🔨 Auto Click Items (Hammer)",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoClick = Value
       task.spawn(function()
           while _G.AutoClick do
               local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
               if tool then
                   tool:Activate()
                   task.wait(0.01)
                   tool:Deactivate()
               end
               task.wait(0.01)
           end
       end)
   end,
})

MainTab:CreateToggle({
   Name = "💰 Auto Collect Platforms",
   CurrentValue = false,
   Callback = function(Value)
       _G.Coll = Value
       task.spawn(function()
           while _G.Coll do
               for i = 1, 50 do task.spawn(function() pcall(function() RF_Collect:InvokeServer(i) end) end) end
               local br = workspace:FindFirstChild("Brainrots")
               if br then for _, v in pairs(br:GetChildren()) do pcall(function() RF_Collect:InvokeServer(v.Name) end) end end
               task.wait(0.4)
           end
       end)
   end,
})

MainTab:CreateSlider({
   Name = "Speed", Range = {16, 250}, Increment = 1, CurrentValue = 16,
   Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end
})
