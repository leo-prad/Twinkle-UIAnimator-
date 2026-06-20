# Sequencing — `UIAnimator.Sequence`

Chains multiple steps in order: run a function and wait for it, wait a fixed time, or
let a step run **without blocking** the next one. This lets you script
multi-stage UI flows without nesting `:Wait()` calls.

```lua
UIAnimator.Sequence(
    steps: { {[string]: any} },
    options: {
        parallel: boolean?,
        onComplete: (() -> ())?,
    }?
)
```

## Step kinds

Each entry in `steps` is a small table. The runner recognises:

| Step shape | Meaning |
|------------|---------|
| `{ fn = f, args = {...} }` | Call `f(unpack(args))` and **wait** for it to return before continuing. |
| `{ wait = n }` | Yield for `n` seconds, then continue. |
| `{ parallel = true }` | Placed **immediately after** an `fn` step, it makes that previous function run non-blocking (spawned), so the next step starts right away. |

> A `{ parallel = true }` with no preceding `fn` step is simply skipped.

## Options

| Option | Description |
|--------|-------------|
| `parallel` | If `true`, the **entire sequence** runs in a spawned thread so the call returns immediately. |
| `onComplete` | Callback fired once every step has finished. |

## Examples

### Sequential

```lua
UIAnimator.Sequence({
    { fn = UIAnimator.FrameSlide, args = { title, true, 0.4 } },
    { wait = 0.2 },
    { fn = UIAnimator.FrameZoom, args = { playButton, true, 0.3 } },
}, {
    onComplete = function()
        print("Intro finished")
    end,
})
```

### Run two animations at once

Mark the first with a following `{ parallel = true }` so the next step doesn't wait
for it:

```lua
UIAnimator.Sequence({
    { fn = UIAnimator.Fade, args = { leftPanel, true } },
    { parallel = true }, -- leftPanel fade runs in the background
    { fn = UIAnimator.Fade, args = { rightPanel, true } }, -- starts immediately
})
```

### Don't block the caller

```lua
UIAnimator.Sequence(steps, { parallel = true })
print("This runs without waiting for the sequence")
```
