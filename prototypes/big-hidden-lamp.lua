blank =
{
     filename = "__StreetLamps__/graphics/transparent_pixel.png",
     priority = "extra-high",
     width = 1,
     height = 1
}

-- Entity
local hiddenLampEntity = table.deepcopy(data.raw["lamp"]["small-lamp"])
hiddenLampEntity.name = "big-hidden-lamp"
hiddenLampEntity.flags = {"placeable-off-grid", "not-on-map"}
hiddenLampEntity.picture_off = blank
hiddenLampEntity.picture_on = blank
hiddenLampEntity.collision_box = {{-0.0, -0.0}, {0.0, 0.0}}
hiddenLampEntity.selection_box = {{-0.0, -0.0}, {0.0, 0.0}}
hiddenLampEntity.selectable_in_game = false
hiddenLampEntity.energy_usage_per_tick = "10KW"
hiddenLampEntity.light = {intensity = 0.9, size = 50}

-- Add definitions to game
data:extend{hiddenLampEntity}