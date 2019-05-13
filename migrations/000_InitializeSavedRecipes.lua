for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["small-street-lamp"].enabled = technologies["optics"].researched

  local energyDistro1Enabled = technologies["electric-energy-distribution-1"].researched
  recipes["medium-street-lamp"].enabled = energyDistro1Enabled
  recipes["big-street-lamp"].enabled = energyDistro1Enabled

  recipes["lighted-substation"].enabled = technologies["electric-energy-distribution-2"].researched

  if technologies["tanks"].researched then
    recipes["explosive-cannon-shell"].enabled = true
    recipes["cannon-shell"].reload()
    recipes["explosive-cannon-shell"].reload()
  end
end