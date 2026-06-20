# `UIAnimator.Fade`

Fades the passed element **and all of its descendants** in or out. When showing, it
sets `Visible = true` first; when hiding, it sets `Visible = false` after the tween
finishes.

```lua
UIAnimator.Fade(
    element: GuiObject,
    show: boolean,
    speed: number?,
    blurEnabled: boolean?,
    hideOtherUi: boolean?,
    customTweenInfo: TweenInfo?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. Its descendants are faded too. |
| `show` | ✅ | `true` fades in, `false` fades out. |
| `speed` | | Tween duration in seconds. Falls back to the `Speed` attribute, then `0.5`. |
| `blurEnabled` | | Blur background + zoom camera. Falls back to `Blur`/`BlurBackground`. |
| `hideOtherUi` | | Hide elements tagged `HideableUI`. Falls back to `HideUI`/`HideOtherUI`. |
| `customTweenInfo` | | Overrides the default tween (and `speed`). Default easing is `Exponential / Out`. |

## Behaviour notes

- When hiding, the element is only set invisible **after** `customTweenInfo.Time`
  seconds, and it is **kept visible** if it has the internal `ShowTextActive`
  attribute (set while [`ShowText`](../04-text-effects/README.md) is running), so a
  text effect isn't cut off.
- The original transparency of each descendant is captured on first use — see the
  [topic overview](README.md#a-note-on-fade-transparency).

## Examples

```lua
-- Simple fade in
UIAnimator.Fade(panel, true)

-- Fade out over 1s with a custom tween
local info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
UIAnimator.Fade(panel, false, nil, nil, nil, info)
```
