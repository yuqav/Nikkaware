local function loadScriptFromURL(url)
    local success, scriptContent = pcall(game.HttpGet, game, url)
    if not success then
        game.Players.LocalPlayer:Kick("Nikkaware does not have a script for this place")
        return
    end

    success, result = pcall(loadstring(scriptContent))
end

if not _G.FB35D then
    _G.FB35D = true
    loadScriptFromURL("https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/Functions/" .. game.PlaceId .. ".lua")
end
