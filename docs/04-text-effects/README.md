# Text effects — `UIAnimator.ShowText`

Animates text **character by character** inside a container, using a swappable
effect preset. Each character becomes its own temporary `TextLabel` laid out within
the bounds of a source label.

```lua
UIAnimator.ShowText(
    container: Frame,
    label: TextLabel,
    text: string?,
    options: ShowTextOptions?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `container` | ✅ | A `Frame` that acts as the layout boundary for the generated characters. |
| `label` | ✅ | A `TextLabel` that defines the font, size, colour, and play area. It is hidden (`Visible = false`) while the effect plays. |
| `text` | | The string to display. Falls back to `label.Text`. |
| `options` | | See [`ShowTextOptions`](#options) below. |

## Options

`ShowTextOptions` (exported type — see [reference/types.md](../reference/types.md)):

| Field | Type | Description |
|-------|------|-------------|
| `effect` | string? | One of `"Typewriter"`, `"Jitter"`, `"PlopIn"`, `"Bubbly"`, `"Glitch"`, `"FadeIn"`. Default `"Typewriter"`. |
| `interval` | number? | Time between each character appearing. |
| `speed` | number? | Duration of each character's entry animation (meaning varies per effect — e.g. Jitter step rate, PlopIn slide duration). |
| `intensity` | number? | Magnitude of the effect (e.g. Jitter pixel shift, PlopIn pixels above spawn). |
| `onComplete` | (() -> ())? | Callback fired when all characters have appeared. |

> The exact preset behaviours live in `Presets/Text/<Effect>`. The available effects
> are the ones listed in the `effect` field above.

## Behaviour notes

- If the source `label` has `TextScaled = true`, `ShowText` measures the best fitting
  `TextSize` (via a hidden clone + binary search) so the generated characters match.
- Generated characters are tagged with the internal `CharLabel` attribute and are
  cleaned up automatically when the effect is replaced or when the `label` is hidden.
- While running, the container has the internal `ShowTextActive` attribute set to
  `true`. [`Fade`](../02-frame-animations/fade.md) checks this so it won't prematurely
  hide an element mid-effect.
- Calling `ShowText` again on the same container cancels the previous run (its Trove
  is destroyed) before starting the new one.

## Examples

```lua
-- Typewriter intro
UIAnimator.ShowText(titleContainer, titleLabel, "PRESS START", {
    effect = "Typewriter",
    interval = 0.06,
})

-- Glitchy reveal with a callback
UIAnimator.ShowText(container, label, "SYSTEM ONLINE", {
    effect = "Glitch",
    onComplete = function()
        print("done")
    end,
})
```
