-- Item
local smallStreetLampItem = table.deepcopy(data.raw["item"]["small-electric-pole"])

smallStreetLampItem.name = "small-street-lamp"
smallStreetLampItem.order = "a[energy]-a[small-street-lamp]"
smallStreetLampItem.place_result = "small-street-lamp"

-- Entity
local smallStreetLampEntity = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])

smallStreetLampEntity.name = "small-street-lamp"
smallStreetLampEntity.minable = {hardness = 0.3, mining_time = 0.6, result = "small-street-lamp"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["small-electric-pole"])
recipe.enabled = false
recipe.name = "small-street-lamp"
recipe.ingredients = {{"copper-cable",2},{"iron-plate",5},{"small-lamp", 1},{"small-electric-pole", 1}}
recipe.result = "small-street-lamp"
recipe.result_count = 1

-- Add definitions to game
data:extend{smallStreetLampItem, smallStreetLampEntity, recipe}

-- Technology
table.insert(
    data.raw["technology"]["optics"].effects,
    {
        type = "unlock-recipe",
        recipe = "small-street-lamp"
    }
)