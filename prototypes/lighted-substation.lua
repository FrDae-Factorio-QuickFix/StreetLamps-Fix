-- Item
local lightedSubstationItem = table.deepcopy(data.raw["item"]["substation"])

lightedSubstationItem.name = "lighted-substation"
lightedSubstationItem.order = "a[energy]-e[lighted-substation]"
lightedSubstationItem.place_result = "lighted-substation"

-- Entity
local lightedSubstationEntity = table.deepcopy(data.raw["electric-pole"]["substation"])

lightedSubstationEntity.name = "lighted-substation"
lightedSubstationEntity.minable = {hardness = 0.6, mining_time = 1.0, result = "lighted-substation"}

-- Recipe
local recipe = table.deepcopy(data.raw.recipe["substation"])
recipe.enabled = false
recipe.name = "lighted-substation"
recipe.ingredients = {{"copper-cable",8},{"steel-plate",10},{"small-lamp", 1},{"substation", 1}}
recipe.result = "lighted-substation"
recipe.result_count = 1

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