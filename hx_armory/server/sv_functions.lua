function sendWebhook(color, name, message)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**HX_ARMORY**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = 'Haxalotts Developments',
              },
          }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('hx_armory:server:armourLog', function(amount)
    local Identifier = GetPlayerIdentifierByType(source, 'license')
    local name       = GetPlayerName(source)
    local embed = {
        {
            ["color"] = 16777215,
            ["title"] = "**HX_ARMORY**",
            ["description"] = '**Player Name:** '.. name ..' \n **License:** '.. Identifier ..' \n **Action:** Put on armour \n **Amount:** '.. amount,
            ["footer"] = {
                ["text"] = 'Haxalotts Developments',
            },
        }
    }
  PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = 'ARMORY LOGS - ARMOUR', embeds = embed}), { ['Content-Type'] = 'application/json' })
end)