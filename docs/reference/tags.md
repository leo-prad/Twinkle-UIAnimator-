# Tag reference (CollectionService)

Twinkle reacts to these [CollectionService](https://create.roblox.com/docs/reference/engine/classes/CollectionService)
tags. For each tag it processes everything already tagged when the module loads **and**
listens with `GetInstanceAddedSignal` so instances tagged later at runtime are
handled too.

| Tag | Applies to | Effect | Docs |
|-----|------------|--------|------|
| `Animatable` | Buttons / GuiObjects | Hover-grow / press-shrink animation (5% default). | [Button styles](../05-button-interactions/button-styles.md) |
| `HideableUI` | Any GuiObject | Eligible to be hidden by the "hide other UI" behaviour; restored by `ShowUI`. | [Visibility](../08-visibility/README.md) |
| `SpecialEffects` | Any GuiObject | Applies an EasyVisuals effect from the `EffectType` attribute. | [Special effects](../06-visual-effects/special-effects.md) |
| `SpinUI` | Any GuiObject | Rotates continuously (`-180 → 180` over 9s). | [Spinning](../06-visual-effects/spinning.md) |
| `SpinGradient` | UIGradient | Rotates the gradient continuously (`RotateSpeed`). | [Spinning](../06-visual-effects/spinning.md) |
| `ResponsiveText` | TextLabel / TextButton | Scales `TextSize` to the viewport, re-runs on resize. | [Responsive text](../09-responsive-text/README.md) |

## Adding a tag

In Studio: use the **Tag Editor** (View → Tag Editor) and assign the tag to the
instance. From code:

```lua
local CollectionService = game:GetService("CollectionService")
CollectionService:AddTag(instance, "SpinUI")
```
