# Exported types

Twinkle exports two Luau types you can reference in your own typed code. Because they
are exported from the module, you can pull them off the required module type.

## `CameraProps`

Used by [`SetCameraProps`](../07-camera-and-blur/README.md#uianimatorsetcameraprops).

```lua
export type CameraProps = {
    fovIn: number?,     -- FOV to zoom into, default 60
    position: Vector3?, -- world position to move camera to
    rotation: CFrame?,  -- full CFrame rotation (ignores position if CFrame is set)
}
```

## `ShowTextOptions`

Used by [`ShowText`](../04-text-effects/README.md).

```lua
export type ShowTextOptions = {
    effect: ("Typewriter" | "Jitter" | "PlopIn" | "Bubbly" | "Glitch" | "FadeIn")?,
    interval: number?,
    speed: number?,
    intensity: number?,
    onComplete: (() -> ())?,
}
```

## Referencing the types

```lua
local UIAnimator = require(your.path.to.twinkle)

type CameraProps = UIAnimator.CameraProps
type ShowTextOptions = UIAnimator.ShowTextOptions

local opts: ShowTextOptions = { effect = "Jitter", interval = 0.05 }
```
