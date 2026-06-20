# Button interactions

Twinkle gives buttons life in two ways, both mostly **automatic**:

| Feature | How it activates | Docs |
|---------|------------------|------|
| Hover/press scale animations | Tag a button `Animatable` (or call `SetButtonStyle`) | [button-styles.md](button-styles.md) |
| Click/hover sounds | Add a `clickSound` / `hoverSound` attribute to the button | [button-sounds.md](button-sounds.md) |

Both apply to existing buttons **and** buttons created later at runtime — Twinkle
listens for additions to the `PlayerGui` and the `Animatable` tag.
