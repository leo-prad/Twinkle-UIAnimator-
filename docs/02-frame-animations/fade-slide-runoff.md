# `UIAnimator.FadeSlideRunoff`

A one-shot "toast"-style animation: the element fades + slides **in** to a resting
position, then fades + slides **off** past it (a runoff). Good for transient
notifications that appear and drift away.

```lua
UIAnimator.FadeSlideRunoff(
    element: GuiObject,
    speed: number?,
    blurEnabled: boolean?,
    hideOtherUi: boolean?,
    runOffAtEnd: number?,
    customStartPosition: UDim2?,
    customEndPosition: UDim2?,
    customTweenInfo: TweenInfo?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. |
| `speed` | | Duration of the entry tween. Falls back to `Speed`, then `0.5`. |
| `blurEnabled` | | Blur background + zoom camera. Falls back to `Blur`/`BlurBackground`. |
| `hideOtherUi` | | Hide elements tagged `HideableUI`. Falls back to `HideUI`/`HideOtherUI`. |
| `runOffAtEnd` | | Duration of the fade-out/runoff slide, in seconds. Default `0.5`. |
| `customStartPosition` | | Entry start position. Default `UDim2.new(0.5, 0, 0.6, 0)`. |
| `customEndPosition` | | Resting position. Default `UDim2.new(0.5, 0, 0.5, 0)`. |
| `customTweenInfo` | | Overrides the entry tween (and `speed`). Default easing `Linear`. |

## Behaviour notes

- The runoff target is computed automatically: it continues past the end position by
  half the start→end vertical distance.
- The whole sequence **yields**: entry tween → runoff tween. The element is set
  `Visible = false` at the end.
- Internally uses [`Fade`](fade.md) for the in/out opacity.

## Example

```lua
-- Show a quick "+1 Level!" toast that drifts off
UIAnimator.FadeSlideRunoff(levelUpLabel, 0.3, false, false, 0.6)
```
