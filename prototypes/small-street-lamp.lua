-- Item
local smallStreetLampItem = table.deepcopy(data.raw["item"]["small-electric-pole"])

smallStreetLampItem.name = "small-street-lamp"
smallStreetLampItem.order = "a[energy]-a[small-street-lamp]"
smallStreetLampItem.place_result = "small-street-lamp"

-- Entity
local smallStreetLampEntity = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])

smallStreetLampEntity.name = "small-street-lamp"
smallStreetLampEntity.minable = {mining_time = 0.2, result = "small-street-lamp"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["small-electric-pole"])
recipe.enabled = false
recipe.name = "small-street-lamp"
recipe.ingredients = 
{
    {type = "item", name = "copper-cable", amount = 2},
    {type = "item", name = "iron-plate", amount = 5},
    {type = "item", name = "small-lamp", amount = 1},
    {type = "item", name = "small-electric-pole", amount = 1}
}
results = 
{
    {type = "item", name = "small-street-lamp", amount = 1}
} 
-- recipe.result = "small-street-lamp"
-- recipe.result_count = 1

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
