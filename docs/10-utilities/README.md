# Utilities

Smaller helpers that don't fit a larger topic.

## `UIAnimator.RegisterIcon`

Stores a reference to an icon associated with a named frame, in an internal registry
(`IconRegistry[frameName] = icon`).

```lua
UIAnimator.RegisterIcon(icon: any, frameName: string)
```

| Parameter | Description |
|-----------|-------------|
| `icon` | The icon object/reference to store. |
| `frameName` | The key (frame name) to store it under. |

```lua
UIAnimator.RegisterIcon(shopIcon, "Shop")
```

> This populates a lookup table other systems in your game can read by frame name.
> Twinkle stores the reference for you; how you consume the registry is up to your
> own code.

---

## See also

- [Camera & blur](../07-camera-and-blur/README.md) — `SetBlurSize`, `ToggleBlur`,
  `SetCameraProps`
- [Visibility](../08-visibility/README.md) — `ShowUI`
