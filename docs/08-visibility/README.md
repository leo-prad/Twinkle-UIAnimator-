# Visibility & the `HideableUI` tag

Twinkle has a simple "hide everything else while this is open" system built on a
CollectionService tag.

## The `HideableUI` tag

Tag any GUI element with `HideableUI` to mark it as something that should be hidden
when another element opens with the "hide other UI" behaviour.

```lua
CollectionService:AddTag(hudFrame, "HideableUI")
```

## How it's triggered

The frame animations ([`Fade`](../02-frame-animations/fade.md),
[`FrameSlide`](../02-frame-animations/frame-slide.md),
[`FrameZoom`](../02-frame-animations/frame-zoom.md),
[`FadeSlideRunoff`](../02-frame-animations/fade-slide-runoff.md),
[`Static`](../02-frame-animations/static.md)) accept a `hideOtherUi` argument, which
also falls back to the `HideUI` / `HideOtherUI` attribute on the element being
animated. When enabled, every element tagged `HideableUI` is hidden while the new
element is shown.

## `UIAnimator.ShowUI`

Re-shows every element tagged `HideableUI` (sets `Visible = true` on all of them).

```lua
UIAnimator.ShowUI()
```

Call this to bring back the HUD/menus after closing a panel that hid them.

```lua
-- Open a fullscreen menu that hides the HUD
UIAnimator.FrameSlide(menu, true, 0.4, true, false, true) -- hideOtherUi = true
-- ...later, close it and restore the HUD
UIAnimator.FrameSlide(menu, false, 0.4)
UIAnimator.ShowUI()
```

## Instant toggle — `Static`

For an immediate (non-animated) show/hide that still applies blur/hide-other-UI side
effects, use [`UIAnimator.Static`](../02-frame-animations/static.md).
