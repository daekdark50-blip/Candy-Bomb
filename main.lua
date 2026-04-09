-- [[ FUT BLOOD: O.G. VERSION | LOADED VIA GITHUB | BY DARK ]] --
local p = game.Players.LocalPlayer
local pgui = p:WaitForChild("PlayerGui")
local ts = game:GetService("TweenService")
local run = game:GetService("RunService")

-- Жесткая чистка перед стартом (удаляем следы других хабов)
local function clear(n) local o = pgui:FindFirstChild(n) if o then o:Destroy() end end
for _, n in pairs({"FUT_GUI", "FUT_ICON", "FUT_STATS_HEAD", "FUT_GLITCH", "DL_HUB", "DL_ICON"}) do clear(n) end

local function getChar() return p.Character or p.CharacterAdded:Wait() end

-- --- [ ГЛАВНОЕ МЕНЮ ] --- --
local function CreateMenu()
    local sg = Instance.new("ScreenGui", pgui); sg.Name = "FUT_GUI"; sg.ResetOnSpawn = false
    local main = Instance.new("Frame", sg); main.Size = UDim2.new(0, 360, 0, 530); main.Position = UDim2.new(0.5, -180, 0.5, -265); main.BackgroundColor3 = Color3.fromRGB(5, 0, 0); main.ClipsDescendants = true; main.Visible = true
    Instance.new("UICorner", main); Instance.new("UIStroke", main).Color = Color3.fromRGB(255, 0, 0)
    
    -- Кровавый фон
    local bg = Instance.new("ImageLabel", main); bg.Size = UDim2.new(1.6, 0, 1.6, 0); bg.Position = UDim2.new(-0.3, 0, -0.3, 0); bg.Image = "rbxassetid://132890001"; bg.ImageColor3 = Color3.fromRGB(120, 0, 0); bg.BackgroundTransparency = 0.6; bg.ZIndex = 1

    local header = Instance.new("TextLabel", main); header.Size = UDim2.new(1, 0, 0, 60); header.Position = UDim2.new(0,0,0,10); header.Text = "★ FUT BLOOD by(Dark) ★"; header.TextColor3 = Color3.new(1,0,0); header.Font = Enum.Font.Creepster; header.TextSize = 32; header.BackgroundTransparency = 1; header.ZIndex = 10
    local userL = Instance.new("TextLabel", main); userL.Size = UDim2.new(1, 0, 0, 20); userL.Position = UDim2.new(0,0,0,65); userL.Text = "† USER: "..p.Name.." †"; userL.TextColor3 = Color3.new(0.6,0,0); userL.Font = Enum.Font.Code; userL.BackgroundTransparency = 1; userL.ZIndex = 10

    local mainC = Instance.new("ScrollingFrame", main); mainC.Size = UDim2.new(1, -20, 1, -170); mainC.Position = UDim2.new(0, 10, 0, 145); mainC.BackgroundTransparency = 1; mainC.AutomaticCanvasSize = "Y"; mainC.ZIndex = 10; Instance.new("UIListLayout", mainC).Padding = UDim.new(0, 10)

    local function addB(name, cb)
        local b = Instance.new("TextButton", mainC); b.Size = UDim2.new(1, 0, 0, 48); b.BackgroundColor3 = Color3.fromRGB(25, 0, 0); b.Text = "† "..name.." †"; b.TextColor3 = Color3.new(0.9,0,0); b.Font = Enum.Font.Code; b.ZIndex = 20; Instance.new("UICorner", b); Instance.new("UIStroke", b).Color = Color3.new(0.6,0,0)
        b.MouseButton1Click:Connect(function() pcall(cb) end)
    end

    addB("INSTANT GRAB (AUTO)", function() 
        _G.InstantGrab = not _G.InstantGrab
        task.spawn(function()
            while _G.InstantGrab do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then v.HoldDuration = 0; if p:DistanceFromCharacter(v.Parent.Position) < 15 then fireproximityprompt(v) end end
                end
                task.wait(0.1)
            end
        end)
    end)
    addB("SAVE_BASE_TP", function() _G.Base = getChar().HumanoidRootPart.CFrame end)
    addB("TELEPORT_TO_BASE", function() if _G.Base then getChar().HumanoidRootPart.CFrame = _G.Base end end)

    -- ИКОНКА (КНОПКА ОТКРЫТИЯ)
    local sgI = Instance.new("ScreenGui", pgui); sgI.Name = "FUT_ICON"; sgI.ResetOnSpawn = false
    local btn = Instance.new("TextButton", sgI); btn.Size = UDim2.new(0, 80, 0, 80); btn.Position = UDim2.new(0, 20, 0.5, -40); btn.BackgroundColor3 = Color3.new(0,0,0); btn.Text = "† FUT †\nDark"; btn.TextColor3 = Color3.new(1,0,0); btn.Font = Enum.Font.Creepster; btn.TextSize = 18; btn.ZIndex = 100
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1,0); Instance.new("UIStroke", btn).Color = Color3.new(1,0,0)
    btn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

    -- ВЕЧНЫЕ СТАТЫ ПИНГ/ФПС
    task.spawn(function()
        while true do
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                if not pgui:FindFirstChild("FUT_STATS_HEAD") then
                    local bill = Instance.new("BillboardGui", pgui); bill.Name = "FUT_STATS_HEAD"; bill.Adornee = char.Head; bill.Size = UDim2.new(0, 250, 0, 50); bill.AlwaysOnTop = true; bill.ExtentsOffset = Vector3.new(0, 3.5, 0)
                    local txt = Instance.new("TextLabel", bill); txt.Size = UDim2.new(1,0,1,0); txt.BackgroundTransparency = 1; txt.Font = Enum.Font.Creepster; txt.TextSize = 22
                    task.spawn(function()
                        while bill.Parent and char.Parent do
                            txt.Text = "† FPS: "..math.floor(1/run.RenderStepped:Wait()).." | MS: "..math.floor(p:GetNetworkPing()*1000).." †"
                            txt.TextColor3 = Color3.new(0,0,0):Lerp(Color3.fromRGB(200, 0, 0), (math.sin(tick() * 3) + 1) / 2)
                            task.wait(0.1)
                        end
                    end)
                end
            end
            task.wait(2)
        end
    end)
end

-- --- [ ГЛИТЧ-ЗАГРУЗЧИК ] --- --
local function StartGlitchLoader()
    local sg = Instance.new("ScreenGui", pgui); sg.Name = "FUT_GLITCH"
    local f = Instance.new("Frame", sg); f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundColor3 = Color3.new(0, 0, 0)
    local mainT = Instance.new("TextLabel", f); mainT.Size = UDim2.new(1, 0, 0, 100); mainT.Position = UDim2.new(0, 0, 0.5, -50); mainT.TextColor3 = Color3.new(1, 0, 0); mainT.Font = Enum.Font.Creepster; mainT.TextSize = 50; mainT.BackgroundTransparency = 1

    task.spawn(function()
        for i = 0, 100 do
            mainT.Text = "† BREACHING: "..i.."% †"
            mainT.Position = UDim2.new(0, math.random(-10, 10), 0.5, -50 + math.random(-10, 10))
            if i == 99 then mainT.Text = "† ERROR: 666% †"; task.wait(0.5) end
            task.wait(0.03)
        end
        sg:Destroy()
        CreateMenu()
    end)
end

StartGlitchLoader()
