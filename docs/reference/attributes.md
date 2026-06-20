# Attribute reference

Every attribute Twinkle reads. Attributes live on different hosts — the **element**
being animated, the **module script**, or the **player** — as noted in the *Host*
column.

## On the animated element

### Animation arguments (frame animations)

| Attribute | Type | Default | Used by | Meaning |
|-----------|------|---------|---------|---------|
| `Speed` | number | `0.5` | All frame animations | Tween duration fallback. |
| `Blur` / `BlurBackground` | boolean | `false` | All frame animations | Blur background + zoom camera. |
| `HideUI` / `HideOtherUI` | boolean | `false` | All frame animations | Hide elements tagged `HideableUI`. |
| `CustomStartPos` | UDim2 | `(0.5,0,1.5,0)` | `FrameSlide` | Slide start position fallback. |
| `CustomEndPos` | UDim2 | `(0.5,0,0.5,0)` | `FrameSlide` | Slide end position fallback. |
| `CustomStartSize` | UDim2 | `(0,0,0,0)` | `FrameZoom` | Zoom-in start size fallback. |
| `CustomEndSize` | UDim2 | `(0,0,0,0)` | `FrameZoom` | Zoom-out target size fallback. |

### Button styling (hover/press)

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `HoverType` | string | `"Grow"` | Hover preset (`Lift`/`Bounce`/`Grow`). |
| `PressType` | string | `"Shrink"` | Press preset (`Shrink`/`Punch`). |
| `HoverIntensity` | number | `5` | Hover scale magnitude. |
| `PressIntensity` | number | `10` | Press magnitude. |
| `ScalePercent` | number | `5` | Written by `SetButtonStyle`. |

### Button sounds

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `hoverSound` | number / string | — | Sound id played on `MouseEnter`. |
| `clickSound` | number / string | — | Sound id played on `Activated`. |

### Special effects (EasyVisuals)

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `EffectType` | string | — (required) | EasyVisuals effect name. |
| `EffectSpeed` | number | `0.35` | Effect speed. |
| `EffectSize` | number | `1` | Effect size. |

### Responsive text

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `MinTextSize` | number | `10` | Minimum responsive text size. |
| `MaxTextSize` | number | `32` | Maximum / base text size. |

### Gradient spin

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `RotateSpeed` | number | `7` | Seconds per `-180 → 180` sweep (on a `UIGradient`). |

## On the module script (`UIAnimator`)

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `RippleEnabled` | boolean | `false` | Enable the click ripple effect. Read once on load. |
| `RippleColor` | Color3 | white | Ripple colour. |
| `RippleSize` | number | `50` | Ripple final diameter (px). |
| `RippleFadeTime` | number | `0.2` | Ripple grow/fade duration. |

## On the player (`Players.LocalPlayer`)

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `UISounds` | boolean | `true` (when unset) | Global toggle for all Twinkle UI sounds. Changes apply live. |

---

## Internal / managed attributes — don't set these

Twinkle writes these itself to capture original state or guard against double
work. Treat them as read-only:

`OriginalBGTransparency`, `OriginalTextTransparency`, `OriginalImageTransparency`,
`OriginalStrokeTransparency`, `OriginalSize`, `OriginalPos`, `Spinning`,
`ShowTextActive`, `CharLabel`.
