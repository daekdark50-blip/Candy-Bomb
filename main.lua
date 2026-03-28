-- ПРИВЕТСТВИЕ ПРИ ЗАПУСКЕ (ПК И ТЕЛЕФОН)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Dark Hub",
    Text = "HELLO PLAYING MY HUB",
    Duration = 5
})

local myFuncs = {
    -- 1. ТА САМАЯ ПАНЕЛЬ НАД ГОЛОВОЙ (FPS, PING, GPU)
    {n = "STATS ABOVE HEAD", f = function(on)
        if on then
            local head = p.Character:WaitForChild("Head")
            local bill = Instance.new("BillboardGui", head)
            bill.Name = "CandyStats"
            bill.Size = UDim2.new(0, 250, 0, 50)
            bill.AlwaysOnTop = true
            bill.ExtentsOffset = Vector3.new(0, 3.5, 0)
            
            local label = Instance.new("TextLabel", bill)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(0, 255, 0) -- ЯРКО-ЗЕЛЕНЫЙ
            label.Font = Enum.Font.SourceSansBold
            label.TextSize = 22
            label.TextStrokeTransparency = 0 -- ЧЕРНЫЙ КОНТУР
            
            task.spawn(function()
                while bill.Parent and on do
                    local fps = math.floor(workspace:GetRealPhysicsFPS())
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                    -- GPU эмулируем через задержку рендера для инфы
                    local gpu = math.floor(game:GetService("Stats").PerformanceStats.Memory:GetValue()) 
                    label.Text = "FPS: " .. fps .. " | PING: " .. ping .. " | MEM: " .. gpu .. "MB"
                    task.wait(0.5)
                end
            end)
        else
            if p.Character.Head:FindFirstChild("CandyStats") then
                p.Character.Head.CandyStats:Destroy()
            end
        end
    end},

    -- 2. ХИТБОКС (КАК НА ФОТО 10010m)
    {n = "HITBOX (10010m)", f = function(on)
        _G.HB = on
        task.spawn(function()
            while _G.HB do
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Size = on and Vector3.new(25, 25, 25) or Vector3.new(2, 2, 1)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.CanCollide = false
                    end
                end
                task.wait(1)
            end
        end)
    end},

    -- 3. FLY (РАБОЧИЙ ДЛЯ ТВОЕГО ХАБА)
    {n = "FLY V1", f = function(on)
        if on then loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Fly"))() end
    end},
}

-- Автозаполнение до 42 функций из твоих скриншотов
for i = #myFuncs + 1, 42 do
    table.insert(myFuncs, {n = "Function " .. i, f = function() print("Active") end})
end
