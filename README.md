# You Died

Factorio mod that replaces the default **game lost** / player death sound with the Dark Souls "You Died" sting.

## Compatibility

- **Factorio:** 2.1 (stable)
- **Dependencies:** `base >= 2.1.0`
- Works with Space Age (no Space Age feature flags required; this mod only overrides a core utility sound)

## How it works

During the data stage the mod overrides [`UtilitySounds`](https://lua-api.factorio.com/latest/prototypes/UtilitySounds.html) `game_lost` on the `default` utility-sounds prototype:

```lua
data.raw["utility-sounds"]["default"].game_lost = {
  filename = "__YouDied__/sounds/you_died.ogg",
  volume = 1.5,
  aggregation = {max_count = 3, remove = true}
}
```

Factorio plays that utility sound when the player dies / the game is lost (`utility/game_lost`). No runtime (`control.lua`) script is required.

## Install

1. Copy this folder into your Factorio `mods` directory as `YouDied` or `YouDied_2.0.0`, **or** zip it as `YouDied_2.0.0.zip` with the mod files inside (see [Mod structure](https://lua-api.factorio.com/latest/auxiliary/mod-structure.html)).
2. Enable **You Died** in the in-game mod manager.
3. Die once (or otherwise trigger game lost) and listen for the sting.

## Manual checks

After updating Factorio to the latest 2.1 stable build:

1. Confirm the mod loads with no errors in `factorio-current.log`.
2. Start a new or existing save and die as the player character — the Dark Souls sound should play instead of the default game-lost sound.
3. Optional: open the in-game mod browser entry and confirm title, description, and changelog render correctly.

## Files

| Path | Role |
| --- | --- |
| `info.json` | Mod identity, `factorio_version`, dependencies |
| `data.lua` | Loads sound prototype override |
| `prototypes/sound.lua` | `game_lost` utility sound override |
| `sounds/you_died.ogg` | Replacement audio |
| `locale/en/YouDied.cfg` | Localized mod name / description |
| `changelog.txt` | In-game changelog ([format](https://lua-api.factorio.com/latest/auxiliary/changelog-format.html)) |
| `thumbnail.png` | Mod browser thumbnail |

## Links

- Mod portal: [YouDied](https://mods.factorio.com/mod/YouDied)
- Source: [VictorJozwicki/factorio-you-died-sound](https://github.com/VictorJozwicki/factorio-you-died-sound)
- Factorio docs: [Mod structure](https://lua-api.factorio.com/latest/auxiliary/mod-structure.html), [UtilitySounds](https://lua-api.factorio.com/latest/prototypes/UtilitySounds.html)
