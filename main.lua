-- ФУНКЦИЯ ESP (Улучшенная для противника)
Button.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем конфеты, бомбы, мины и ловушки
        local name = v.Name:lower()
        if v:IsA("BasePart") and (name:find("candy") or name:find("bomb") or name:find("mine") or name:find("trap")) then
            if not v:FindFirstChild("BrightHighlight") then
                local h = Instance.new("Highlight", v)
                h.Name = "BrightHighlight"
                h.FillColor = Color3.fromRGB(255, 0, 0) -- Красный для опасности
                h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур
                h.FillOpacity = 0.5
            end
        end
    end
    Button.Text = "ВСЁ ВИЖУ!"
end)
