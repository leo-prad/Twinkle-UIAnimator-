# Frame animations

These methods show, hide, and move `GuiObject`s with tweens. They all share a few
**common optional behaviours** read either from the call arguments or from
attributes on the element:

| Behaviour | Argument | Attribute fallback | Default |
|-----------|----------|--------------------|---------|
| Animation speed (seconds) | `speed` | `Speed` | `0.5` |
| Background blur + camera zoom | `blurEnabled` | `Blur` / `BlurBackground` | `false` |
| Hide other `HideableUI` elements | `hideOtherUi` | `HideUI` / `HideOtherUI` | `false` |

> The blur/zoom and hide-other-UI flags are resolved by `resolveAnimArgs`. Passing
> the argument explicitly always wins over the attribute.

## Methods

| Method | Use it for |
|--------|------------|
| [`Fade`](fade.md) | Fade an element and all descendants in/out |
| [`Static`](static.md) | Toggle visibility instantly (no tween) |
| [`FrameSlide`](frame-slide.md) | Slide a frame in/out, optionally fading |
| [`FrameZoom`](frame-zoom.md) | Scale a frame in/out from its centre |
| [`FrameBounce`](frame-bounce.md) | A quick size bounce for feedback |
| [`FadeSlideRunoff`](fade-slide-runoff.md) | Slide in, then fade + slide off |

## A note on "fade" transparency

Fading walks the element and every descendant, and supports `TextLabel`,
`TextButton`, `TextBox`, `ImageLabel`, `ImageButton`, plain `GuiObject`s, and
`UIStroke`. On the first fade it captures the original transparency into attributes
(`OriginalBGTransparency`, `OriginalTextTransparency`, `OriginalImageTransparency`,
`OriginalStrokeTransparency`) so it can restore the correct value when fading back
in. **Don't set those attributes yourself** — they're managed internally.
