# Responsive text — `ResponsiveText` tag

Keeps a `TextLabel`/`TextButton`'s `TextSize` proportional to the screen resolution,
so text looks consistent across devices instead of being scaled by Roblox's
`TextScaled`.

## Setup

Tag the text element with `ResponsiveText`:

```lua
CollectionService:AddTag(titleLabel, "ResponsiveText")
```

Twinkle sizes it on load, for elements tagged later at runtime, **and** whenever the
camera's `ViewportSize` changes (e.g. window resize, device rotation).

## How the size is computed

```
scaleFactor = min(viewport.X / 1920, viewport.Y / 1080)
TextSize    = clamp(MaxTextSize * scaleFactor, MinTextSize, MaxTextSize)
```

It also sets `TextScaled = false` and `TextTruncate = SplitWord`.

## Attributes

| Attribute | Default | Meaning |
|-----------|---------|---------|
| `MinTextSize` | `10` | Lower bound for the computed text size. |
| `MaxTextSize` | `32` | Upper bound (and the base size at 1920×1080). |

```lua
titleLabel:SetAttribute("MinTextSize", 14)
titleLabel:SetAttribute("MaxTextSize", 48)
CollectionService:AddTag(titleLabel, "ResponsiveText")
```

> The reference resolution is 1920×1080: at that viewport the text renders at
> `MaxTextSize`, scaling down on smaller screens but never below `MinTextSize`.
