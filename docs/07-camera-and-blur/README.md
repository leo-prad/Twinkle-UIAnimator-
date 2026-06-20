# Camera & blur

Twinkle can blur the 3D background (a `BlurEffect` in `Lighting`) and zoom the camera
when a frame opens. Many [frame animations](../02-frame-animations/README.md) trigger
this via their `blurEnabled` argument or the `Blur` / `BlurBackground` attribute; the
methods here let you configure and drive it directly.

## `UIAnimator.SetBlurSize`

Sets the strength of the blur effect.

```lua
UIAnimator.SetBlurSize(size: number?) -- default 15
```

If a blur is currently active, its size updates immediately.

```lua
UIAnimator.SetBlurSize(24)
```

## `UIAnimator.SetCameraProps`

Sets the camera properties used when blur/zoom is enabled.

```lua
UIAnimator.SetCameraProps(props: CameraProps?)
```

`CameraProps` (exported type — see [reference/types.md](../reference/types.md)):

| Field | Type | Description |
|-------|------|-------------|
| `fovIn` | number? | FOV to zoom into. Default `60`. |
| `position` | Vector3? | World position to move the camera to. |
| `rotation` | CFrame? | Full CFrame rotation (overrides position if set). |

```lua
UIAnimator.SetCameraProps({ fovIn = 45 })
```

> Note: the camera tween driven by `ToggleBlur` currently animates `FieldOfView`
> toward `fovIn`. The original FOV is captured the first time blur/zoom turns on and
> restored when it turns off (guarding against stacked toggles).

## `UIAnimator.ToggleBlur`

Surgically toggles the background blur **and** camera zoom together, **without**
touching any UI visibility.

```lua
UIAnimator.ToggleBlur(enabled: boolean)
```

```lua
UIAnimator.ToggleBlur(true)  -- blur + zoom in
-- ...
UIAnimator.ToggleBlur(false) -- restore
```

Use this when you want the cinematic background treatment on its own — for example,
while a custom UI you animate elsewhere is open.
