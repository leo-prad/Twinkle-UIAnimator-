# Button styles — hover & press animations

A button **scales up on hover** and **down/in on press**, using swappable preset
animations. There are two ways to set this up.

## 1. Automatic — tag `Animatable`

Add the `Animatable` [CollectionService tag](../reference/tags.md) to a button (in
Studio, or via `CollectionService:AddTag`). When Twinkle loads — or when the tag is
added at runtime — it wires the hover/press animation with a default scale of 5%.

```lua
local CollectionService = game:GetService("CollectionService")
CollectionService:AddTag(myButton, "Animatable")
```

## 2. Scripted — `UIAnimator.SetButtonStyle`

Override the preset and intensity at runtime. This (re)builds the hover/press
animation for the element.

```lua
UIAnimator.SetButtonStyle(element: GuiObject, options: {
    hoverType: ("Lift" | "Bounce" | "Grow")?,
    pressType: ("Shrink" | "Punch")?,
    scalePercent: number?,
})
```

| Option | Default | Description |
|--------|---------|-------------|
| `hoverType` | `"Grow"` | Which hover preset to use (`Presets/Hover/<name>`). |
| `pressType` | `"Shrink"` | Which press preset to use (`Presets/Press/<name>`). |
| `scalePercent` | `5` | Hover scale intensity, stored as the `ScalePercent` attribute. |

`SetButtonStyle` writes the `HoverType`, `PressType`, and `ScalePercent` attributes,
then rebuilds the animation (destroying any existing one first).

```lua
UIAnimator.SetButtonStyle(playButton, {
    hoverType = "Lift",
    pressType = "Punch",
    scalePercent = 8,
})
```

## Tuning via attributes

Whether set up by tag or by `SetButtonStyle`, the animation reads these attributes
off the element each time it's built:

| Attribute | Default | Meaning |
|-----------|---------|---------|
| `HoverType` | `"Grow"` | Hover preset name. |
| `PressType` | `"Shrink"` | Press preset name. |
| `HoverIntensity` | `5` | Hover scale magnitude (falls back to the call's `scalePercent`). |
| `PressIntensity` | `10` | Press magnitude. |

So a designer can drop the `Animatable` tag on a button and then tweak `HoverType` /
`PressType` straight from the Studio properties panel — no code required.

## Events used

The animation connects to `MouseEnter`, `MouseLeave`, `InputBegan`, and `InputEnded`
(reacting to `MouseButton1`). Everything is tracked in a Trove so it's cleaned up if
the element is destroyed.
