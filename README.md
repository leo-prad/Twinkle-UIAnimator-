# Twinkle UIAnimator — Documentation

**Twinkle** is a lightweight, open-source UI animation module for Roblox. It removes
boilerplate tween code and gives you a clean, expressive API to animate frames,
buttons, and text — plus a set of **automatic** behaviours driven entirely by
[CollectionService tags](docs/reference/tags.md) and [instance attributes](docs/reference/attributes.md),
so designers can wire up effects from Studio without touching code.

This project documents every piece of functionality the package exposes to other
developers under the [`docs/`](docs/) folder.

---

## How the package is organised

There are two ways to use Twinkle:

1. **The scripting API** — call methods like `UIAnimator.Fade(frame, true)` from your
   own LocalScripts.
2. **Automatic behaviours** — add a tag (e.g. `SpinUI`) or an attribute
   (e.g. `hoverSound`) to a GUI instance and Twinkle wires the behaviour up for you
   when it loads, including instances created later at runtime.

Most topics below mix both styles.

---

## Topics

| # | Topic | What's inside |
|---|-------|---------------|
| 01 | [Getting started](docs/01-getting-started/README.md) | Install, dependencies, requiring the module |
| 02 | [Frame animations](docs/02-frame-animations/README.md) | `Fade`, `Static`, `FrameSlide`, `FrameZoom`, `FrameBounce`, `FadeSlideRunoff` |
| 03 | [Sequencing](docs/03-sequencing/README.md) | `Sequence` — chaining animations |
| 04 | [Text effects](docs/04-text-effects/README.md) | `ShowText` + effect presets |
| 05 | [Button interactions](docs/05-button-interactions/README.md) | `SetButtonStyle`, hover/press presets, button sounds |
| 06 | [Visual effects](docs/06-visual-effects/README.md) | Special effects, spinning, ripple, `Shake` |
| 07 | [Camera & blur](docs/07-camera-and-blur/README.md) | `SetBlurSize`, `ToggleBlur`, `SetCameraProps` |
| 08 | [Visibility](docs/08-visibility/README.md) | `HideableUI` tag, `ShowUI`, `Static` |
| 09 | [Responsive text](docs/09-responsive-text/README.md) | `ResponsiveText` tag |
| 10 | [Utilities](docs/10-utilities/README.md) | `RegisterIcon` |

## Reference

| Page | What's inside |
|------|---------------|
| [Attributes](docs/reference/attributes.md) | Every attribute Twinkle reads, where, and its default |
| [Tags](docs/reference/tags.md) | Every CollectionService tag Twinkle reacts to |
| [Types](docs/reference/types.md) | Exported Luau types (`CameraProps`, `ShowTextOptions`) |

---

## Quick example

```lua
local UIAnimator = require(your.path.to.twinkle)

-- Slide a menu in with a fade and a background blur
UIAnimator.FrameSlide(menuFrame, true, 0.4, true, true)

-- Type a line of text into a label
UIAnimator.ShowText(container, titleLabel, "Welcome!", { effect = "Typewriter" })
```
