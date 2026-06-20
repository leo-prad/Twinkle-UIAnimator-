# Click ripple effect

An optional screen-wide ripple that expands from the cursor (or screen centre on
gamepad) on every click/tap. It's configured by **attributes on the UIAnimator module
script itself** and evaluated once when the module loads.

## Enabling

Set these attributes on the `UIAnimator` ModuleScript (in Studio, or via
`script:SetAttribute(...)` before requiring):

| Attribute | Type | Default | Meaning |
|-----------|------|---------|---------|
| `RippleEnabled` | boolean | `false` | Master switch. Must be exactly `true` to enable. |
| `RippleColor` | Color3 | `Color3.fromRGB(255, 255, 255)` | Ripple colour. |
| `RippleSize` | number | `50` | Final diameter of the ripple, in pixels. |
| `RippleFadeTime` | number | `0.2` | How long the ripple grows + fades, in seconds. |

> These are read **once** at module load into local constants, so change them before
> the module first runs (e.g. set them on the asset in Studio).

## How it works

When enabled, Twinkle creates a dedicated `ScreenGui` named `RippleGui` (high
`DisplayOrder`, `ResetOnSpawn = false`) inside the `PlayerGui` and listens to
`UserInputService.InputBegan`. It reacts to:

- `MouseButton1` clicks
- `Touch` taps
- Gamepad `ButtonA` (ripple originates from screen centre)

Each input spawns a circular `Frame` (via `UICorner`) that tweens up to `RippleSize`
while fading out, then destroys itself.

## Example

```lua
-- Before requiring the module (e.g. on the asset's attributes in Studio)
script:SetAttribute("RippleEnabled", true)
script:SetAttribute("RippleColor", Color3.fromRGB(0, 170, 255))
script:SetAttribute("RippleSize", 80)
script:SetAttribute("RippleFadeTime", 0.25)
```
