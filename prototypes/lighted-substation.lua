-- Item
local lightedSubstationItem = table.deepcopy(data.raw["item"]["substation"])

lightedSubstationItem.name = "lighted-substation"
lightedSubstationItem.order = "a[energy]-e[lighted-substation]"
lightedSubstationItem.place_result = "lighted-substation"

-- Entity
local lightedSubstationEntity = table.deepcopy(data.raw["electric-pole"]["substation"])

lightedSubstationEntity.name = "lighted-substation"
lightedSubstationEntity.minable = {mining_time = 0.2, result = "lighted-substation"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["substation"])
recipe.enabled = false
recipe.name = "lighted-substation"
recipe.ingredients = 
{
    {type = "item", name = "copper-cable", amount = 8},
    {type = "item", name = "steel-plate", amount = 10},
    {type = "item", name = "small-lamp", amount = 1},
    {type = "item", name = "substation", amount = 1}
}
results = 
{
    {type = "item", name = "lighted-substation", amount = 1}
 } 
-- recipe.result = "lighted-substation"
-- recipe.result_count = 1

-- Add definitions to game
data:extend{lightedSubstationItem, lightedSubstationEntity, recipe}

-- Technology
table.insert(
    data.raw["technology"]["electric-energy-distribution-2"].effects,
    {
        type = "unlock-recipe",
        recipe = "lighted-substation"
    }
)
