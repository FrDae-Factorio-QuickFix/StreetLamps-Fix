global["street-lamp-names"] = {"small-street-lamp", "medium-street-lamp", "big-street-lamp", "lighted-substation"}
global["street-lamp-map"] = {
   ["small-street-lamp"] = "small-hidden-lamp",
   ["medium-street-lamp"] = "medium-hidden-lamp",
   ["big-street-lamp"] = "big-hidden-lamp",
   ["lighted-substation"] = "substation-hidden-lamp"
}

--[[
   Searches a table for a given value
   @param table The table to search
   @param value The value to search for
   @returns True if the value is found; false otherwise
]]
function hasValue(table, value)
   for key, val in ipairs(table) do
      if val == value then
         return true
      end
   end

   return false
end

--[[
   Retreive the correct lamp name for the given electric pole
   @param poleName The name of the electric pole to match
]]
function getLampName(poleName)
   return global["street-lamp-map"][poleName];
end

--[[
   Event handler to determine if a hidden lamp should be built with an electric pole
   @param event The event that triggered this handler
]]
function onBuiltEntity(event)
   if hasValue(global["street-lamp-names"], event.created_entity.name) then
      local entity = event.created_entity
      local surface = entity.surface
      local position = {
         entity.position.x,
         entity.position.y
      }

      local lamp = surface.create_entity{name = getLampName(entity.name), position = position, force = game.forces.neutral}
      lamp.destructible = false
   end
end

--[[
   Event handler to determine if a hidden lamp exists and should be destroyed with an electric pole
   @param event The event that triggered this handler
]]
function onMinedEntity(event)
   if hasValue(global["street-lamp-names"], event.entity.name) then
      local entity = event.entity
      local lamp = entity.surface.find_entity(getLampName(entity.name), {entity.position.x, entity.position.y})

      if lamp ~= nil then
         lamp.destroy()
      end      
   end
end
   
script.on_event(defines.events.on_built_entity, onBuiltEntity)
script.on_event(defines.events.on_robot_built_entity, onBuiltEntity)
script.on_event(defines.events.on_pre_player_mined_item, onMinedEntity)
script.on_event(defines.events.on_entity_died, onMinedEntity)
script.on_event(defines.events.on_robot_pre_mined, onMinedEntity)