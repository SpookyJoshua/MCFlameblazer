
# Flameblazer Jet Datapack (Minecraft 1.20.1)

This datapack adds a controllable flame jet effect with the following features:
- **Start Height Control**: How far above the command block/player the flame begins.
- **Flame Length Control**: How tall the flame jet appears.
- **Continuous Mode**: Toggle between single bursts or continuous flame jets.
- **Duration & Speed**: Control burst length and rise speed.
- **Colour & Smoke**: Switch between orange/blue flame and smoke on/off.

---

## Installation
1. Copy the zip to your world:
   ```
   .minecraft/saves/<YourWorld>/datapacks/
   ```
2. In-game run:
   ```
   /reload
   /datapack list
   ```
   You should see the datapack enabled.

3. Initialise (optional):
   ```
   /function flameblazer:load
   ```

If it doesn't load, try extracting the ZIP into a folder in the `datapacks` directory so the structure is:
```
datapacks/FlameblazerJet/
  pack.mcmeta
  data/
    flameblazer/
      functions/
    minecraft/
      tags/functions/
```

---

## Commands & Controls

### Fire a Flame Jet
- Player-triggered:
  ```
  /trigger fb_fire
  ```
- From a command block (spawns at configured height):
  ```
  function flameblazer:burst
  ```

### Settings Menu
- Show current settings:
  ```
  /trigger fb_menu
  ```

---

### Control Commands

| Setting          | Increase             | Decrease             | Notes                         |
|------------------|----------------------|----------------------|-------------------------------|
| Start Height      | /trigger fb_height_plus | /trigger fb_height_minus | 1 = low, 10 = high            |
| Flame Length      | /trigger fb_len_plus    | /trigger fb_len_minus    | 1 = short, 10 = tall          |
| Duration (burst)  | /trigger fb_dur_plus    | /trigger fb_dur_minus    | 1 = 1s, 5 = 5s                |
| Speed (burst)     | /trigger fb_spd_plus    | /trigger fb_spd_minus    | 1 = slow, 5 = fast            |
| Continuous Mode   | /trigger fb_continuous  | -                       | Toggle ON/OFF                 |
| Colour            | /trigger fb_color       | -                       | 0 = orange, 1 = blue          |
| Smoke             | /trigger fb_smoke       | -                       | Toggle ON/OFF                 |

---

## Notes
- Continuous mode: Toggle ON then use `/trigger fb_fire` once to spawn; toggle OFF to clear flame jets.
- Use command blocks for automation or redstone control.
- Multiple flame jets can run simultaneously.

---

## Requirements
- **Minecraft Java Edition 1.20.1**
- Works in singleplayer and multiplayer worlds where datapacks are enabled.

---

## Uninstallation
1. Remove the ZIP or folder from the `datapacks` directory.
2. Run `/reload` in-game.
