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

Factorio requires the mod folder (or zip) name to match `info.json` — **`YouDied` or `YouDied_2.0.1`** (case sensitive). The git repo name `factorio-you-died-sound` will **not** load and produces: `Directory name of mod ... doesn't match the expected YouDied or YouDied_2.0.1`.

1. Copy or symlink this checkout into `%APPDATA%\Factorio\mods\` as `YouDied` / `YouDied_2.0.1`, **or** zip the mod files as `YouDied_2.0.1.zip` (see [Mod structure](https://lua-api.factorio.com/latest/auxiliary/mod-structure.html)). Do not leave the folder named after the GitHub repo.
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
