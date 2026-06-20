# `UIAnimator.FrameBounce`

Quickly scales an element up and back down — a small "pop" for feedback (e.g. when a
counter increases or a button confirms an action).

```lua
UIAnimator.FrameBounce(
    element: GuiObject,
    speed: number?,
    bouncePercent: number?
)
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `element` | ✅ | Any `GuiObject`. |
| `speed` | | Duration of each half of the bounce, in seconds. Default `0.7`. |
| `bouncePercent` | | How much larger it grows at peak, in percent. Default `35` (i.e. 1.35×). |

## Behaviour notes

- The element's current size is captured into the `OriginalSize` attribute the first
  time it bounces, and it always returns to that size.
- `FrameBounce` **yields** until both the grow and shrink tweens complete (`Quad/Out`
  easing each way).

## Example

```lua
-- Pop the coin label when the player earns coins
UIAnimator.FrameBounce(coinLabel, 0.15, 25)
```
