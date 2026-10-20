# 03 · Cut several stills into one video

**Request:** "I generated six frames of a foggy fishing town. Make one moody video out of them, not six separate clips."

| Tag | File |
|---|---|
| @Image1 | `01-harbour.png` |
| @Image2 | `02-lighthouse.png` |
| @Image3 | `03-nets.png` |
| @Image4 | `04-tavern-window.png` |
| @Image5 | `05-boots-on-pier.png` |
| @Image6 | `06-boat-leaving.png` |

**Settings:** omni-reference, 16:9, 12 s.

```
A slow, moody opening-titles montage about a fog-bound fishing town, made of six separate shots joined by clean hard cuts. Shot on 35mm film: soft grain, muted greens and greys, gentle halation on lights, overcast light. Each shot recreates its reference image exactly — composition, lighting and details — with only subtle, slow motion. Every cut changes the angle and the shot size.

Shot 1 (0–2s), @Image1: wide shot of the harbour; fog rolls slowly between the moored boats and masts sway gently.
Shot 2 (2–4s), @Image2: the lighthouse beam sweeps once through the fog.
Shot 3 (4–6s), @Image3: close-up of wet fishing nets dripping onto the planks.
Shot 4 (6–8s), @Image4: through the tavern window, a candle flickers and a shadow passes behind the glass.
Shot 5 (8–10s), @Image5: rubber boots walk slowly along the wet pier, away from the camera.
Shot 6 (10–12s), @Image6: a small boat leaves the harbour into the fog until only its light remains; fade to black.

Audio: (a slow, low cello melody that rises slightly over the last two shots and resolves on one long note) <water laps against the pilings> <a distant foghorn sounds once>. No dialogue.
Hard cuts only, with no morphing between shots. No text, no logos, no watermarks.
```

**Why it works**

- Each still is bound to one timed shot, so the model never has to guess which image goes where.
- Every cut is high-delta (a new angle and a new shot size). This is what makes Seedance cut cleanly instead of dissolving.
- The "hard cuts only" lock appears at the top and again at the end.
- With more stills than the shots that fit, split them into several videos sharing the same style line and join them in an editor.
