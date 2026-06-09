# FL Studio Quick Quantize Shortcut Fix

Remaps `Cmd + Q` on macOS to trigger **Quick Quantize** in FL Studio instead of quitting it.

## What It Does

| Action | Result |
|---|---|
| Tap `Cmd + Q` in FL Studio | Triggers Quick Quantize |
| Hold `Cmd + Q` for 1.5s in FL Studio | Quits FL Studio |
| `Cmd + Q` anywhere else | Quits the app normally |

## Requirements

- macOS
- [Hammerspoon](https://www.hammerspoon.org/) (free, open source)
- FL Studio with `Cmd + Option + Q` set as the Quick Quantize shortcut

## Installation

### Step 1 — Install Hammerspoon
1. Download from [hammerspoon.org](https://www.hammerspoon.org/)
2. Drag `Hammerspoon.app` into your `/Applications` folder
3. Open it — a hammer icon will appear in your menu bar
4. When prompted, go to **System Settings > Privacy & Security > Accessibility** and enable Hammerspoon

### Step 2 — Set Up the Script
1. Click the hammer icon in the menu bar and select **Open Config**
2. Copy the contents of `init.lua` from this repo into that file
3. Save the file
4. Click the hammer icon again and select **Reload Config**

## Troubleshooting

**Shortcut not working in FL Studio?**
Open the Hammerspoon Console (hammer icon > Console) and run:
```lua
hs.timer.doAfter(5, function()
 print(hs.application.frontmostApplication():name())
end)
```
Switch to FL Studio immediately after running it. Note the exact name printed.

Then open `init.lua` and find this line:

```lua
if flApp and flApp:name() == "FL Studio" then
```

Replace `FL Studio` with whatever name was printed in the console.

**`Cmd + Q` still quitting other apps normally?**
That is expected — the remap only activates when FL Studio is the focused window.

## Known Issues

- There is a 0.3 second delay before quantize fires. This is required for FL Studio to receive the keystroke reliably.

## License

MIT — free to use, modify, and share.