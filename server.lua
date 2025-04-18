RegisterNetEvent('antiCrash:logDetection', function(detail, count, category)
    local src = source
    local name = GetPlayerName(src)
    local time = os.date('%Y-%m-%d %H:%M:%S')

    local reasons = {
        rate = "⚠️ Spawn Rate Abuse",
        invalid_model = "🚫 Invalid Model Hash",
        apply_force_abuse = "💣 Force Exploit (ApplyForceToEntity)"
    }

    local embed = {
        {
            ["title"] = "🚨 Crash Exploit Detected",
            ["color"] = 16720418,
            ["fields"] = {
                { ["name"] = "Player", ["value"] = name .. " [ID: " .. src .. "]", ["inline"] = true },
                { ["name"] = "Type", ["value"] = reasons[category] or category, ["inline"] = true },
                { ["name"] = "Detail", ["value"] = detail, ["inline"] = false },
                { ["name"] = "Time", ["value"] = time, ["inline"] = true }
            }
        }
    }

    if Config.DebugPrint then
        print(("[AntiCrash] %s [%s] triggered %s | %s"):format(name, src, category, detail))
    end

    exports['screenshot-basic']:requestClientScreenshot(src, {
        encoding = 'url',
        quality = 0.8
    }, function(data)
        if data and data.url then
            embed[1]["image"] = { ["url"] = data.url }
        end

        PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({
            username = "CrashDetector",
            embeds = embed,
            avatar_url = "https://i.imgur.com/5oXBBKX.png"
        }), { ['Content-Type'] = 'application/json' })
    end)
end)
