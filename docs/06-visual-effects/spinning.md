# Continuous rotation — `SpinUI` & `SpinGradient`

Two tag-driven behaviours rotate things forever. Both start automatically on load and
for instances tagged later at runtime.

## `SpinUI` — spin a GUI element

Tag any `GuiObject` with `SpinUI` and it rotates continuously from `-180°` to `180°`
over a fixed 9-second loop.

```lua
CollectionService:AddTag(loadingIcon, "SpinUI")
```

Notes:
- The element gets an internal `Spinning` attribute set to `true` to prevent the
  rotation being started twice.
- The loop stops on its own when the element leaves the DataModel (`item.Parent`
  becomes `nil`).

## `SpinGradient` — rotate a UIGradient

Tag a `UIGradient` with `SpinGradient` and its `Rotation` loops from `-180°` to
`180°` indefinitely. The speed is configurable.

```lua
gradient:SetAttribute("RotateSpeed", 4) -- seconds per sweep (default 7)
CollectionService:AddTag(gradient, "SpinGradient")
```

| Attribute | Default | Meaning |
|-----------|---------|---------|
| `RotateSpeed` | `7` | Seconds per full `-180 → 180` sweep. |

The tween is cancelled automatically when the gradient is destroyed.
