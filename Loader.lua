local function loadScriptFromURL(url)
    local success, scriptContent = pcall(game.HttpGet, game, url)
    if not success then
        return
    end

    success, result = pcall(loadstring(scriptContent))
end

if not _G.FB35D then
    _G.FB35D = true
    loadScriptFromURL("https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/Functions/" .. game.PlaceId .. ".lua")
end
