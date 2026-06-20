# `UIAnimator.Shake`

Plays a high-frequency shake/vibration on a UI element — handy for damage feedback,
errors, or emphasis.

```lua
UIAnimator.Shake(
    instance: GuiObject,
    magnitude: number?,
    roughness: number?,
    duration: number?
)
```

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `instance` | ✅ | — | The UI object to shake. |
| `magnitude` | | `1` | How far it deviates from centre. `1` ≈ `0.01` scale units. |
| `roughness` | | `1` | Multiplier on the number of jitter steps per shake. |
| `duration` | | `0.05` | How long the shake lasts, in seconds. |

## Behaviour notes

- The element's resting position is captured into the `OriginalPos` attribute on
  first use, and the element is reset to it before each shake — so rapid repeated
  calls (e.g. continuous damage) don't cause drift.
- The shake runs in a spawned thread (non-blocking) and returns the element to
  `OriginalPos` when finished.

## Example

```lua
-- Strong, brief shake when the player takes a hit
UIAnimator.Shake(healthBar, 3, 2, 0.2)
```
