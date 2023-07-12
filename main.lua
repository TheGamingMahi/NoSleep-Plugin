local plugin = lukkit.plugin("NoSleep", "1.0")
--local storage = plugin.getconfig()

plugin.onEnable(function()
    logger.info("NoSleep plugin enabled!")
end)

plugin.onDisable(function()
    logger.info("NoSleep plugin disabled!")
end)

plugin.registerevent("PlayerBedEnterEvent", function(event)
    local player = event:getplayer
    player:sethealth(0)
    Player:sendmessage("Sleeping not allowed in this server")
  end)
