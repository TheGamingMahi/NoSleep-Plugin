local pluginConfig = plugin.getStorageObject("config.yml") -- Create config.yml

if pluginConfig:setDefaultValue("Kill-the-player-On-Sleep", false) then -- Create value
  pluginConfig:save() -- Save value
end

if pluginConfig:setDefaultValue("Enable-Sleep-Message", true) then -- Create value
  pluginConfig:save() -- Save value
end

if pluginConfig:setDefaultValue("On-Sleep-Message", "Sleeping not allowed in this server") then -- Create value
  pluginConfig:save() -- Save value
end

local PlayerKill = pluginConfig:getValue("Kill-the-player-On-Sleep")
local SleepMessage = pluginConfig:getValue("On-Sleep-Message")
local EnableSleepMessage = pluginConfig:getValue("Enable-Sleep-Message")

plugin.onEnable(function()
  logger.info("NoSleep plugin enabled!")
end)

plugin.onDisable(function()
  logger.info("NoSleep plugin disabled!")
end)

plugin.registerEvent("PlayerBedEnterEvent", function(event)
  local player = event:getPlayer()
  if PlayerKill then   
    player:setHealth(0)
  end
  if EnableSleepMessage then
  player:sendMessage(SleepMessage)
  end
  event:setCancelled(true) -- Cancel sleep
end)