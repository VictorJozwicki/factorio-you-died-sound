-- Override UtilitySounds::game_lost (played on player death / game lost).
-- See https://lua-api.factorio.com/latest/prototypes/UtilitySounds.html
data.raw["utility-sounds"]["default"].game_lost =
{
  filename = "__YouDied__/sounds/you_died.ogg",
  volume = 1.5,
  aggregation = {max_count = 3, remove = true}
}
