# `UIAnimator.FrameSlide`

Slides a frame from a start position to an end position (or back out). Optionally
fades the element and its descendants as it moves.

```lua
UIAnimator.FrameSlide(
    element: GuiObject,
    show: boolean,
    speed: number?,
    fadeIn: boolean?,
    blurEnabled: boolean?,
    hideOtherUi: boolean?,
    resetOgPos: boolean?,
    customStartPosition: UDim2?,
    customEndPosition: UDim2?,
    customTweenInfo: TweenInfo?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. |
| `show` | ✅ | `true` slides in to the end position, `false` slides back out to the start position. |
| `speed` | | Tween duration. Falls back to `Speed`, then `0.5`. |
| `fadeIn` | | When showing, also fade the element + descendants in as it slides. |
| `blurEnabled` | | Blur background + zoom camera. Falls back to `Blur`/`BlurBackground`. |
| `hideOtherUi` | | Hide elements tagged `HideableUI`. Falls back to `HideUI`/`HideOtherUI`. |
| `resetOgPos` | | When hiding, restore the element's pre-animation position after it goes invisible. |
| `customStartPosition` | | Start position. Falls back to the `CustomStartPos` attribute, then `UDim2.new(0.5, 0, 1.5, 0)` (off-screen bottom). |
| `customEndPosition` | | End position. Falls back to the `CustomEndPos` attribute, then `UDim2.new(0.5, 0, 0.5, 0)` (centre). |
| `customTweenInfo` | | Overrides the default tween (and `speed`). Default easing is `Sine / InOut`. |

## Behaviour notes

- `FrameSlide` **yields** until the tween completes (`tween.Completed:Wait()`).
- When showing, it sets `Position = start` and `Visible = true` before tweening to
  `end`. When hiding, it tweens back to `start` and then sets `Visible = false`.

## Examples

```lua
-- Slide a shop panel up into view, fading as it comes
UIAnimator.FrameSlide(shop, true, 0.4, true)

-- Slide it back down and out
UIAnimator.FrameSlide(shop, false, 0.4)
```

You can also configure default positions from Studio without arguments:

```lua
shop:SetAttribute("CustomStartPos", UDim2.fromScale(0.5, -0.5)) -- comes from the top
shop:SetAttribute("CustomEndPos", UDim2.fromScale(0.5, 0.5))
UIAnimator.FrameSlide(shop, true)
```
