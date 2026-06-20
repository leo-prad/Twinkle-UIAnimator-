# `UIAnimator.Static`

Instantly toggles visibility and the environment effects (blur/camera, hiding other
UI) with **no animation**. Use it when you want the same blur/hide side effects as
the animated methods but an immediate cut.

```lua
UIAnimator.Static(
    element: GuiObject,
    show: boolean,
    speed: number?,      -- ignored, kept for signature consistency
    blurEnabled: boolean?,
    hideOtherUi: boolean?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. |
| `show` | ✅ | `true` shows, `false` hides. |
| `speed` | | Ignored. Present only so the signature matches the animated methods. |
| `blurEnabled` | | Blur background + zoom camera. Falls back to `Blur`/`BlurBackground`. |
| `hideOtherUi` | | Hide elements tagged `HideableUI`. Falls back to `HideUI`/`HideOtherUI`. |

## Example

```lua
-- Snap a HUD on with blur, no tween
UIAnimator.Static(hud, true, nil, true)
```
