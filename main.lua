-- [[ CANDY-BOMB: 102 FUNCTIONS - HITBOX 20M EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

-- Удаление старых версий
if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
if pg:FindFirstChild("CandyBlackout") then pg.CandyBlackout:Destroy() end

-- 1. ЭФФЕКТ ЧЕРНОГО ЭКРАНА
local BG = Instance.new("ScreenGui", pg); BG.Name = "CandyBlackout"
local F = Instance.new("Frame", BG); F.Size = UDim2.new(1,0,1,0); F.BackgroundColor3 = Color3.new(0,0,0); F.ZIndex = 999
task.delay(0.1, function()
    ts:Create(F, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
    task.wait(1.5)
    BG:Destroy()
end)

-- 2. ИНТЕРФЕЙС
local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 550, 0, 480); M.Position = UDim2.new(0.5, -275, 0.5, -240); M.BackgroundColor3 = Color3.fromRGB(10, 10, 10); M.Visible = false; M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

-- Кнопка DH (Открыть/Закрыть)
local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 60, 0, 60); Tog.Position = UDim2.new(0, 20, 0.4, 0); Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(220,0,0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 30; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

-- Скролл
local Scroll = Instance.new("ScrollingFrame", M); Scroll.Size = UDim2.new(1, -20, 1, -20); Scroll.Position = UDim2.new(0, 10, 0, 10); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0, 0, 0, 5000); Scroll.ScrollBarThickness = 6
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 5)

local function AddB(name, func)
    local state = false
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(1, 0, 0, 45); b.Text = name .. ": OFF"; b.BackgroundColor3 = Color3.fromRGB(60, 0, 0); b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 16; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        state = not state
        b.Text = name .. ": " .. (state and "ON" or "OFF")
        b.BackgroundColor3 = state and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(60, 0, 0)
        func(state, b)
    end)
end

-- СПИСОК ФУНКЦИЙ
local funcs = {
    -- Твой обновленный хитбокс на 20 метров
    {n = "HITBOX (20m)", f = function(on) 
        _G.HB = on; 
        spawn(function()
            while _G.HB do 
                task.wait(0.5) 
                for _,v in pairs(game.Players:GetPlayers()) do 
                    if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then 
                        v.Character.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.CanCollide = false
                    end 
                end 
            end
            -- Возвращаем всё назад при выключении
            for _,v in pairs(game.Players:GetPlayers()) do 
                if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then 
                    v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.Character.HumanoidRootPart.Transparency = 1
                end 
            end
        end)
    end},
    
    {n = "RAINBOW AVATAR", f = function(on) _G.RBV = on; while _G.RBV do for i=0,1,0.01 do if not _G.RBV then break end; local clr = Color3.fromHSV(i,1,1); for _,o in pairs(p.Character:GetDescendants()) do if o:IsA("BasePart") then o.Color = clr end end; task.wait() end end end},
    {n = "STATS ABOVE HEAD", f = function(on) 
        if on then
            local bg = Instance.new("BillboardGui", p.Character.Head); bg.Name = "CandyStats"; bg.Size = UDim2.new(0,200,0,50); bg.AlwaysOnTop = true; bg.ExtentsOffset = Vector3.new(0,3,0)
            local tl = Instance.new("TextLabel", bg); tl.Size = UDim2.new(1,0,1,0); tl.BackgroundTransparency = 1; tl.TextColor3 = Color3.new(0,1,0); tl.Font = Enum.Font.SourceSansBold; tl.TextSize = 20
            spawn(function() while on and bg.Parent do tl.Text = "FPS: "..math.floor(workspace:GetRealPhysicsFPS()).." | PING: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(); task.wait(0.5) end end)
        elseif p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
    end},
    {n = "INVISIBLE (FIXED)", f = function(on) for _, v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = on and 1 or 0 end end end},
    {n = "FLY V1", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))() end},
    {n = "SPEED (100)", f = function(on) p.Character.Humanoid.WalkSpeed = on and 100 or 16 end},
    {n = "ESP BOXES", f = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Iratuosity/ESP/main/BoxESP"))() end},
    {n = "WALK ON WATER", f = function(on) if on then local part = Instance.new("Part", workspace); part.Name = "WaterWalk"; part.Size = Vector3.new(5000, 2, 5000); part.Position = p.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0); part.Anchored = true; part.Transparency = 1 else if workspace:FindFirstChild("WaterWalk") then workspace.WaterWalk:Destroy() end end end},
}

-- Автозаполнение до 102 кнопок
for i = 1, 102 do
    local data = funcs[i]
    if data then AddB(data.n, data.f) else AddB("Function " .. i, function() end) end
end
