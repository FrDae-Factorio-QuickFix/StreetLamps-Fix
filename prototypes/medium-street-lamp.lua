-- Item
local mediumStreetLampItem = table.deepcopy(data.raw["item"]["medium-electric-pole"])

mediumStreetLampItem.name = "medium-street-lamp"
mediumStreetLampItem.order = "a[energy]-b[medium-street-lamp]"
mediumStreetLampItem.place_result = "medium-street-lamp"

-- Entity
local mediumStreetLampEntity = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])

mediumStreetLampEntity.name = "medium-street-lamp"
mediumStreetLampEntity.minable = {mining_time = 0.2, result = "medium-street-lamp"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["medium-electric-pole"])
recipe.enabled = false
recipe.name = "medium-street-lamp"
recipe.ingredients = 
{
    {type = "item", name = "copper-cable", amount = 4},
    {type = "item", name = "steel-plate", amount = 4},
    {type = "item", name = "small-lamp", amount = 1},
    {type = "item", name = "medium-electric-pole", amount = 1}
}
results = 
{
    {type = "item", name = "medium-street-lamp", amount = 1}
} 
-- recipe.result = "medium-street-lamp"
-- recipe.result_count = 1

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
