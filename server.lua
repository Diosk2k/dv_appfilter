-- server.lua
local Config = LoadConfig()
local Locales = LoadLocales()

function LoadConfig()
    local config = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
    if config then
        return assert(load(config))().Config
    else
        return {}
    end
end

function LoadLocales()
    local locales = LoadResourceFile(GetCurrentResourceName(), 'locales.js')
    if locales then
        return assert(load(locales))().Locales
    else
        return {}
    end
end

RegisterNetEvent('playerConnecting')
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()

    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local steamIdentifier = nil
    local discordIdentifier = nil

    for _, identifier in ipairs(identifiers) do
        if Config.filter['steam'] and string.sub(identifier, 1, string.len("steam:")) == "steam:" then
            steamIdentifier = identifier
        elseif Config.filter['discord'] and string.sub(identifier, 1, string.len("discord:")) == "discord:" then
            discordIdentifier = identifier
        end

        if steamIdentifier and discordIdentifier then
            break
        end
    end

    local locale = Config.language
    local locales = Locales[locale]

    if Config.filter['steam'] and not steamIdentifier and Config.filter['discord'] and not discordIdentifier then
        deferrals.done(locales['both_not_started'])
    elseif Config.filter['steam'] and not steamIdentifier then
        deferrals.done(locales['only_steam_not_started'])
    elseif Config.filter['discord'] and not discordIdentifier then
        deferrals.done(locales['only_discord_not_started'])
    else
        deferrals.done(locales['both_started'])
    end
end)
