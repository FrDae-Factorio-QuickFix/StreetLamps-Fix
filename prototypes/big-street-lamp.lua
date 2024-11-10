-- Item
local bigStreetLampItem = table.deepcopy(data.raw["item"]["big-electric-pole"])

bigStreetLampItem.name = "big-street-lamp"
bigStreetLampItem.order = "a[energy]-c[big-street-lamp]"
bigStreetLampItem.place_result = "big-street-lamp"

-- Entity
local bigStreetLampEntity = table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

bigStreetLampEntity.name = "big-street-lamp"
bigStreetLampEntity.minable = {mining_time = 0.2, result = "big-street-lamp"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["big-electric-pole"])
recipe.enabled = false
recipe.name = "big-street-lamp"
recipe.ingredients = 
{
    {type = "item", name = "copper-cable", amount = 6},
    {type = "item", name = "steel-plate", amount = 10},
    {type = "item", name = "small-lamp", amount = 1},
    {type = "item", name = "big-electric-pole", amount = 1}
 }
results = 
{
    {type = "item", name = "big-street-lamp", amount = 1}
 } 
-- recipe.result = "big-street-lamp"
-- recipe.result_count = 1

-- Add definitions to game
data:extend{bigStreetLampItem, bigStreetLampEntity, recipe}

-- Technology
table.insert(
    data.raw["technology"]["electric-energy-distribution-1"].effects,
    {
        type = "unlock-recipe",
        recipe = "big-street-lamp"
    }
)
