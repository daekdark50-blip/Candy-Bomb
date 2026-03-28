Tab:CreateButton({
   Name = "Server Hop (Поиск сервера)",
   Callback = function()
      local HttpService = game:GetService("HttpService")
      local TeleportService = game:GetService("TeleportService")
      local PlaceId = game.PlaceId
      local JobId = game.JobId

      -- Функция для поиска и перехода
      local function Teleport()
          local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
          for _, v in pairs(Servers.data) do
              if v.playing < v.maxPlayers and v.id ~= JobId then
                  TeleportService:TeleportToPlaceInstance(PlaceId, v.id, game.Players.LocalPlayer)
                  break
              end
          end
      end

      -- Запуск телепортации
      Teleport()
   end,
})
