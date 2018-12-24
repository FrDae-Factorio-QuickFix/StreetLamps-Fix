-- Item
local mediumStreetLampItem = table.deepcopy(data.raw["item"]["medium-electric-pole"])

mediumStreetLampItem.name = "medium-street-lamp"
mediumStreetLampItem.order = "a[energy]-b[medium-street-lamp]"
mediumStreetLampItem.place_result = "medium-street-lamp"

-- Entity
local mediumStreetLampEntity = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])

mediumStreetLampEntity.name = "medium-street-lamp"
mediumStreetLampEntity.minable = {hardness = 0.4, mining_time = 0.75, result = "medium-street-lamp"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["medium-electric-pole"])
recipe.enabled = false
recipe.name = "medium-street-lamp"
recipe.ingredients = {{"copper-cable", 4},{"steel-plate", 4},{"small-lamp", 1},{"medium-electric-pole", 1}}
recipe.result = "medium-street-lamp"
recipe.result_count = 1

-- Add definitions to game
data:extend{mediumStreetLampItem, mediumStreetLampEntity, recipe}

-- Technology
table.insert(
    data.raw["technology"]["electric-energy-distribution-1"].effects,
    {
        type = "unlock-recipe",
        recipe = "medium-street-lamp"
    }
)