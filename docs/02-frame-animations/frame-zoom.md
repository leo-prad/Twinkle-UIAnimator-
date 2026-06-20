# `UIAnimator.FrameZoom`

Scales a frame in from a small size (a "pop" using `Back/Out` easing) or scales it
back out. The element is anchored at its centre during the animation.

```lua
UIAnimator.FrameZoom(
    element: GuiObject,
    show: boolean,
    speed: number?,
    blurEnabled: boolean?,
    hideOtherUi: boolean?,
    startSize: UDim2?,
    customEndPosition: UDim2?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. |
| `show` | ✅ | `true` zooms in to the original size, `false` zooms out. |
| `speed` | | Tween duration. Falls back to `Speed`, then `0.5`. |
| `blurEnabled` | | Blur background + zoom camera. Falls back to `Blur`/`BlurBackground`. |
| `hideOtherUi` | | Hide elements tagged `HideableUI`. Falls back to `HideUI`/`HideOtherUI`. |
| `startSize` | | Starting size when showing. Falls back to the `CustomStartSize` attribute, then `UDim2.new(0,0,0,0)`. |
| `customEndPosition` | | Position to center on while showing. Default `UDim2.new(0.5, 0, 0.5, 0)`. |

## Behaviour notes

- The first time you show an element, its current size is captured into the
  `OriginalSize` attribute and used as the zoom-in target.
- When hiding, the element shrinks to the `CustomEndSize` attribute (or
  `UDim2.new(0,0,0,0)`), goes invisible, then has its size restored to `OriginalSize`.
- Showing uses `Back / Out` easing (the overshoot "pop"); hiding uses
  `Exponential / Out`.
- `FrameZoom` **yields** until the tween completes.
- Because the element is anchored at `(0.5, 0.5)` during the animation, prefer
  centre-anchored frames or pass `customEndPosition` to control placement.

## Example

```lua
UIAnimator.FrameZoom(rewardPopup, true, 0.35) -- pop in
task.wait(2)
UIAnimator.FrameZoom(rewardPopup, false, 0.25) -- shrink away
```
