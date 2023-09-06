-- Create a storage object with the file "config.yml"
local pluginConfig = plugin.getStorageObject("config.yml")

-- Export the resource if it doesn't exist (replace set to false)
plugin.exportResource("config.yml", false)

-- Retrieve the configuration values
local PlayerKill = pluginConfig:getValue("Kill-the-player-On-Sleep")
local SleepMessage = pluginConfig:getValue("On-Sleep-Message")
local EnableSleepMessage = pluginConfig:getValue("Enable-Sleep-Message")

-- Register plugin events
plugin.onEnable(function()
    logger.info("NoSleep plugin enabled!")
end)

plugin.onLoad(function()
    logger.info("NoSleep Plugin loaded")
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

