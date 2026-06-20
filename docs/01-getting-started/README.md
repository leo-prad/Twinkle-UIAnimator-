# Getting started

## Dependencies

Twinkle depends on two packages (declared in `wally.toml`):

| Dependency | Used for |
|------------|----------|
| [`sleitnick/trove`](https://github.com/Sleitnick/Trove) | Lifecycle/cleanup of connections and instances |
| [`arxkdev/ezvisualz`](https://github.com/arxkdev/ezvisualz) | The special visual effects in [Visual effects](../06-visual-effects/README.md) |

Both are resolved automatically into a `Packages` folder when you install with Wally.
The module requires them as siblings:

```lua
local EasyVisuals = require(script.Parent.ezvisualz)
local Trove = require(script.Parent.trove)
```

## Install

### With Wally (recommended)

```toml
# wally.toml
[dependencies]
twinkle = "caioband/twinkle@0.0.9"
```

Then run `wally install`.

### Manual

1. Drag and drop **UIAnimator** into `ReplicatedStorage`.
2. Drag and drop the **Packages** folder into `ReplicatedStorage`.
3. You are good to go! 🎉

## Requiring the module

Twinkle is a **client-side** module — it reads `Players.LocalPlayer` and the
player's `PlayerGui`. Require it from a **LocalScript**:

```lua
local UIAnimator = require(your.path.to.twinkle)
```

> ⚠️ Requiring Twinkle from a server `Script` will error, because `LocalPlayer`
> only exists on the client.

## What happens on require

The moment the module loads it wires up all the **automatic behaviours** by scanning
the existing `PlayerGui` and listening for future additions:

- Hover/press animations for instances tagged `Animatable`
- Per-button sounds from `clickSound` / `hoverSound` attributes
- Special effects (`SpecialEffects`), spinning (`SpinUI`, `SpinGradient`)
- Responsive text (`ResponsiveText`)
- The click ripple effect (if enabled via script attributes)

So simply requiring the module once on the client is enough to activate the
attribute/tag-driven features. The `UIAnimator.*` methods are then available for
manual, scripted animations.

## Configuring the module

Some global behaviour is controlled by **attributes on the module script itself**
(the ripple effect) and by a **player attribute** (`UISounds`). See the
[Attributes reference](../reference/attributes.md) for the full list.
