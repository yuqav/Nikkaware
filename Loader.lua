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
    loadScriptFromURL("" .. game.PlaceId .. ".lua")
end
