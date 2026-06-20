# Button sounds — `clickSound` & `hoverSound`

Twinkle plays per-button UI sounds driven entirely by **attributes**. Add a
`clickSound` or `hoverSound` attribute to any `GuiButton` (`TextButton` or
`ImageButton`) and Twinkle loads the sound and plays it on the matching event — for
buttons that already exist **and** ones added later, and even if the attribute is
added or changed at runtime.

| Attribute | Plays on | Event |
|-----------|----------|-------|
| `hoverSound` | Mouse enters the button | `GuiObject.MouseEnter` |
| `clickSound` | Button is activated | `GuiButton.Activated` |

## Accepted values

The attribute value is resolved into a `SoundId`:

| You set | Becomes |
|---------|---------|
| A number, e.g. `123456` | `rbxassetid://123456` |
| A numeric string, e.g. `"123456"` | `rbxassetid://123456` |
| A full asset string, e.g. `"rbxassetid://123456"` | used as-is |
| `0`, a negative number, or empty/`nil` | no sound (cleared) |

So the simplest setup is to add a **number attribute** named `clickSound` with your
asset id.

## How it works

For each button, Twinkle:

1. Creates a `Sound` instance (named after the attribute) parented to the button.
2. **Preloads** it via `ContentProvider:PreloadAsync` (in a spawned thread) so the
   first play is responsive.
3. Plays it through the shared `playUIAudio` helper, which respects the global
   [`UISounds`](#muting-all-ui-sounds) toggle.
4. Watches `GetAttributeChangedSignal` for both attributes — if you change the id at
   runtime the `Sound` is rebuilt; if you clear it, the sound is removed.

Everything is tracked in a Trove attached to the button, so the `Sound` instances and
connections are cleaned up automatically when the button is destroyed.

## Examples

### From code

```lua
-- TextButton with hover + click feedback
playButton:SetAttribute("hoverSound", 9120386436)
playButton:SetAttribute("clickSound", 9120388010)
```

### From Studio

1. Select the button.
2. In the Properties/Attributes panel, add an attribute named `clickSound`
   (type *number*) with your sound asset id.
3. Optionally add `hoverSound` the same way.

That's it — no script changes needed; requiring the module on the client activates it.

## Muting all UI sounds

`playUIAudio` checks the `uiSoundsEnabled` flag, which mirrors the **player
attribute** `UISounds`:

```lua
-- Mute every Twinkle UI sound for this player
player:SetAttribute("UISounds", false)

-- Re-enable
player:SetAttribute("UISounds", true)
```

When `UISounds` is unset (or not a boolean) sounds are **enabled** by default.
Twinkle listens for changes to this attribute, so toggling it takes effect
immediately. See the [Attributes reference](../reference/attributes.md).

> **Migration note:** earlier versions also played hardcoded default sounds
> (`UI_Hover` / `UI_Click`) from an `Audio/SFX` folder in `ReplicatedStorage`. That
> automatic behaviour has been removed — button audio now comes solely from the
> `clickSound` / `hoverSound` attributes described here.
