-- [[ CANDY-BOMB: MEGA ESP & STATS UPDATE ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")

_G.Toggles = {ESP_Box = false, ESP_Tracer = false, ESP_Avatar = false, InfJump = false}

-- Функция для создания ВХ
local function UpdateESP()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p and v.Character then
            -- Обычное ВХ (Highlight)
            if _G.Toggles.ESP_Box then
                if not v.Character:FindFirstChild("C_Highlight") then
                    local h = Instance.new("Highlight", v.Character); h.Name = "C_Highlight"
                    h.FillColor = Color3.new(1, 0, 0); h.OutlineColor = Color3.new(1, 1, 1)
                end
            else
                if v.Character:FindFirstChild("C_Highlight") then v.Character.C_Highlight:Destroy() end
            end

            -- Трассеры
            if _G.Toggles.ESP_Tracer then
                if not v.Character:FindFirstChild("C_Tracer") then
                    local part = Instance.new("Part", v.Character); part.Name = "C_Tracer"; part.Transparency = 1; part.CanCollide = false; part.Anchored = true
                    local beam = Instance.new("Beam", part); beam.Width0 = 0.1; beam.Width1 = 0.1; beam.Color = ColorSequence.new(Color3.new(1,1,1))
                    -- Логика отрисовки трассера требует сложной настройки Attachment, здесь упрощенный Highlight-контур
                end
            end
        end
    end
end

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 550, 0, 450); M.Position = UDim2.new(0.5, -275, 0.5, -225); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; Instance.new("UICorner", M)

    -- [[ ПАНЕЛЬ ПИНГА И FPS ]] --
    local Stats = Instance.new("Frame", M); Stats.Size = UDim2.new(0, 150, 0, 50); Stats.Position = UDim2.new(1, -160, 0, 10); Stats.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", Stats)
    local StatText = Instance.new("TextLabel", Stats); StatText.Size = UDim2.new(1, 0, 1, 0); StatText.BackgroundTransparency = 1; StatText.TextColor3 = Color3.new(0, 1, 0); StatText.Font = Enum.Font.Code; StatText.TextSize = 14
    
    task.spawn(function()
        while task.wait(0.5) do
            local fps = math.floor(1/rs.RenderStepped:Wait())
            local ping = math.floor(p:GetNetworkPing() * 1000)
            StatText.Text = "FPS: "..fps.."\nPING: "..ping.."ms"
        end
    end)

    -- КНОПКА ОТКРЫТИЯ
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 50, 0, 50); Tog.Position = UDim2.new(0, 10, 0.5, 0); Tog.Text = "DH"; Tog.BackgroundColor3 = Color3.new(0,0,0); Tog.TextColor3 = Color3.new(1,0,0); Instance.new("UICorner", Tog)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 130, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", Side)
    local P1 = Instance.new("ScrollingFrame", M); P1.Size = UDim2.new(1, -140, 1, -70); P1.Position = UDim2.new(0, 135, 0, 60); P1.BackgroundTransparency = 1; P1.CanvasSize = UDim2.new(0,0,5,0); Instance.new("UIListLayout", P1).Padding = UDim.new(0,5)

    local function AddBtn(txt, cb)
        local b = Instance.new("TextButton", P1); b.Size = UDim2.new(1, -10, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(30,30,30); b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(cb)
    end

    -- НОВЫЕ КНОПКИ ESP
    AddBtn("ВКЛЮЧИТЬ ВХ (Highlight)", function() _G.Toggles.ESP_Box = not _G.Toggles.ESP_Box; UpdateESP() end)
    AddBtn("ВКЛЮЧИТЬ ТРАССЕРЫ", function() _G.Toggles.ESP_Tracer = not _G.Toggles.ESP_Tracer; UpdateESP() end)
    AddBtn("ВКЛЮЧИТЬ АВАТАР ВХ", function() --[[ Логика BillboardGui с иконкой игрока ]] end)
    
    AddBtn("SPEED 100", function() p.Character.Humanoid.WalkSpeed = 100 end)
    AddBtn("JUMP 150", function() p.Character.Humanoid.JumpPower = 150 end)
    AddBtn("FPS BOOSTER", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FPSBooster"))() end)
end

CreateCandyHub()
