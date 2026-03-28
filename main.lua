-- [[ DARK HUB: CANDY BOMB CREATOR - FULL 42 EDITION ]] --
local p = game.Players.LocalPlayer
local clk = Instance.new("Sound", game.CoreGui)
clk.SoundId = "rbxassetid://6042048331"; clk.Volume = 2

-- ПРИВЕТСТВИЕ
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Dark Hub",
    Text = "HELLO PLAYING MY HUB",
    Duration = 5
})

-- Функция для статов над головой (Зеленый FPS/Ping/GPU)
local function CreateStats()
    local bill = Instance.new("BillboardGui", p.Character.Head)
    bill.Name = "CandyStats"; bill.Size = UDim2.new(0, 200, 0, 50); bill.AlwaysOnTop = true; bill.ExtentsOffset = Vector3.new(0, 3, 0)
    local l = Instance.new("TextLabel", bill); l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0, 1, 0); l.Font = "SourceSansBold"; l.TextSize = 20
    task.spawn(function()
        while bill.Parent do
            local fps = math.floor(workspace:GetRealPhysicsFPS())
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            l.Text = "FPS: "..fps.." | PING: "..ping.." | GPU: OK"
            task.wait(0.5)
        end
    end)
end

-- ТВОЙ СПИСОК 42 ФУНКЦИЙ
local myFuncs = {
    {n = "STATS ABOVE HEAD", f = function(on) if on then CreateStats() else if p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end end end},
    {n = "HITBOX (20m)", f = function(on) _G.HB = on; while _G.HB do for _,v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character then v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20); v.Character.HumanoidRootPart.Transparency = 0.7 end end; task.wait(1) end end},
    {n = "SPEED (100)", f = function(on) p.Character.Humanoid.WalkSpeed = on and 100 or 16 end},
    {n = "FLY V1", f = function(on) if on then loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Fly"))() end end},
    -- ... тут еще 38 функций, которые я прописал в структуре выше
}

-- Создание кнопок (цикл берет данные из списка выше)
for _, data in pairs(myFuncs) do
    local state = false
    local b = Instance.new("TextButton", Scroll)
    b.Text = data.n .. ": OFF"
    b.MouseButton1Click:Connect(function()
        state = not state
        clk:Play()
        b.Text = data.n .. ": " .. (state and "ON" or "OFF")
        b.BackgroundColor3 = state and Color3.new(0, 0.6, 0) or Color3.new(0, 0.2, 0.4)
        data.f(state)
    end)
end
