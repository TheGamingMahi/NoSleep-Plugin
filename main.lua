-- Create a storage object with the file "config.yml"
local pluginConfig = plugin.getStorageObject("config.yml")

-- Set default values for the configuration
pluginConfig:setDefaultValue("Kill-the-player-On-Sleep", false)
pluginConfig:setDefaultValue("Enable-Sleep-Message", true)
pluginConfig:setDefaultValue("On-Sleep-Message", "Sleeping not allowed in this server")
pluginConfig:save() -- Save default values

-- Retrieve the configuration values
local PlayerKill = pluginConfig:getValue("Kill-the-player-On-Sleep")
local SleepMessage = pluginConfig:getValue("On-Sleep-Message")
local EnableSleepMessage = pluginConfig:getValue("Enable-Sleep-Message")

-- Register plugin events
plugin.onEnable(function()
    logger.info("NoSleep plugin enabled!")
end)

plugin.onDisable(function()
    logger.info("NoSleep plugin disabled!")
end)

plugin.registerEvent("PlayerBedEnterEvent", function(event)
    local player = event:getPlayer()

    -- Check if the player should be killed on sleep
    if PlayerKill then
        player:setHealth(0)
    end

    -- Check if the sleep message should be sent
    if EnableSleepMessage then
        player:sendMessage(SleepMessage)
    end

    event:setCancelled(true) -- Cancel sleep
end)
