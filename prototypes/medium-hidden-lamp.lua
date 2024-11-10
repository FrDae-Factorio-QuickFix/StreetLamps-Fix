blank =
{
     filename = "__StreetLamps_Fix__/graphics/transparent_pixel.png",
     priority = "extra-high",
     width = 1,
     height = 1
}

-- Entity
local hiddenLampEntity = table.deepcopy(data.raw["lamp"]["small-lamp"])
hiddenLampEntity.name = "medium-hidden-lamp"
hiddenLampEntity.flags = {"placeable-off-grid", "not-on-map"}
hiddenLampEntity.picture_off = blank
hiddenLampEntity.picture_on = blank
hiddenLampEntity.collision_box = {{-0.0, -0.0}, {0.0, 0.0}}
hiddenLampEntity.selection_box = {{-0.0, -0.0}, {0.0, 0.0}}
hiddenLampEntity.selectable_in_game = false
hiddenLampEntity.energy_usage_per_tick = "2KW"
hiddenLampEntity.light = {intensity = 0.8, size = 35}

-- Add definitions to game
data:extend{hiddenLampEntity}
