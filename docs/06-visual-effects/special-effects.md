# Special effects (EasyVisuals)

Applies a decorative visual effect to a GUI instance using the bundled
[`ezvisualz`](https://github.com/arxkdev/ezvisualz) package. This is **tag-driven**.

## Setup

1. Add the `SpecialEffects` [tag](../reference/tags.md) to the instance.
2. Add an `EffectType` attribute naming the effect you want.

When Twinkle loads (or when the tag is added at runtime) it reads the attributes and
calls `EasyVisuals.new(item, effectType, speed, size)`.

## Attributes

| Attribute | Required | Default | Meaning |
|-----------|----------|---------|---------|
| `EffectType` | ✅ | — | The EasyVisuals effect name. If missing, a warning is logged and nothing happens. |
| `EffectSpeed` | | `0.35` | Effect speed passed to EasyVisuals. |
| `EffectSize` | | `1` | Effect size/scale passed to EasyVisuals. |

> The set of valid `EffectType` values is defined by the EasyVisuals package — see
> its documentation for the available effect names.

## Example

```lua
local CollectionService = game:GetService("CollectionService")

badge:SetAttribute("EffectType", "Shine") -- an EasyVisuals effect name
badge:SetAttribute("EffectSpeed", 0.5)
badge:SetAttribute("EffectSize", 1.2)
CollectionService:AddTag(badge, "SpecialEffects")
```
