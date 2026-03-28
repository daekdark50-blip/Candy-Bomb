-- [[ CANDY-BOMB HUB: TRIPLE TAB EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

_G.Toggles = {RainbowSkin = false, Noclip = false, SpinFling = false, ESP = false}

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end
    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 520, 0, 420); M.Position = UDim2.new(0.5, -260, 0.5, -210); M.BackgroundColor3 = Color3.fromRGB(0, 0, 0); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- КНОПКА DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 120, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", Side)
    local Pages = {}
    local function CreateP(name, vis)
        local f = Instance.new("ScrollingFrame", M); f.Size = UDim2.new(1, -130, 1, -20); f.Position = UDim2.new(0, 125, 0, 10); f.BackgroundTransparency = 1; f.Visible = vis; f.CanvasSize = UDim2.new(0, 0, 18, 0); f.ScrollBarThickness = 2
        Instance.new("UIListLayout", f).Padding = UDim.new(0, 5); Pages[name] = f; return f
    end
    
    local P1 = CreateP("Scripts", true)
    local P2 = CreateP("MyHub", false)
    local P3 = CreateP("Tsunami", false)

    -- ВКЛАДКИ
    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 110, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 8; b.TextWrapped = true; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for n, pge in pairs(Pages) do pge.Visible = (n == target) end end)
    end
    AddTab("SCRIPTS", "Scripts")
    AddTab("MY HUB", "MyHub")
    AddTab("SCRIPT ESCAPE TSUNAMI FOR BRAIROT", "Tsunami")

    local function AddB(p, t, c, cb)
        local b = Instance.new("TextButton", p); b.Size = UDim2.new(1, -10, 0, 38); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 13; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- ВКЛАДКА 3 (ДЛЯ ЦУНАМИ)
    AddB(P3, "--- TSUNAMI SPECIAL ---", Color3.fromRGB(0, 0, 150), function() end)
    AddB(P3, "LOAD MYSTRIX HUB 🔥", Color3.fromRGB(0, 50, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))()
    end)
    
    -- (Тут также добавь остальные кнопки из предыдущего кода для P1 и P2)
end
CreateCandyHub()
