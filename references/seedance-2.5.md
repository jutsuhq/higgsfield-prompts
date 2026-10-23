# Seedance 2.5 reference

Model facts and prompting rules for Seedance 2.5, condensed from Higgsfield's and ByteDance-ecosystem guides (sources at the end). Limits change: when a number matters, check the Higgsfield UI.

## Model map

Seedance 2.5 generates picture, dialogue, sound effects and music in one pass.

| Mode | Use it for | Locked by the input |
|---|---|---|
| Text-to-video (t2v) | Prompt only | Nothing |
| Omni-reference | Images, videos or audio as references (characters, locations, props, motion, voice) | A first-frame image fixes the aspect ratio |
| Video edit | Patch one element of an existing clip | Duration and ratio follow the source |
| Video extension | Continue a clip forward or backward | Ratio follows the source |

| Spec | Value |
|---|---|
| Duration | 4–30 s per pass; extension chains go longer |
| Aspect ratios | 21:9, 16:9, 4:3, 1:1, 3:4, 9:16, auto |
| References | Up to about 50 multimodal inputs; the workshop lists 30 images, 10 videos (30 s total) and 10 audio files (30 s total) |
| Audio | Native dialogue, sound effects and music in 10+ languages |

Settings (duration, ratio, resolution) are chosen in the UI, not written into the prompt.

## The base formula

`[Subject + Action] + [Scene] + [Visual style] + [Camera] + [Audio]`

- Subject + action is the only mandatory block. Name a concrete action with a beginning and an end ("seals the letter and presses the wax stamp"), not an activity ("works at a desk").
- Write the camera as an ordered sequence ("starts wide, tracks around, ends on a push-in"). A camera block without an order invites random cuts.
- Give audio at least two concrete sources. "Cinematic sound" is not a direction.
- Each missing block has a typical failure: a vague action gives a static, boring shot; no style block lets the look drift; no audio block gives silent or generic sound.

Long, multi-shot prompts can use labelled sections in this order: global style, scene logline, characters, location, first frame and blocking, shot list, optics, camera, physics, lighting, audio. Put one visual rule at the top and one sound rule at the bottom.

## Sound and text brackets

| Bracket | Meaning | Example |
|---|---|---|
| `( )` | Music: instrument, rhythm, mood, how it evolves and resolves | `(a sparse piano line that swells and resolves on one held chord)` |
| `< >` | One sound effect per event, tied to the visible action that makes it | `<the kettle lid rattles as it boils>` |
| `{ }` | A spoken line | `{We're late.}` |
| `【 】` | On-screen text, never spoken | `【Three days earlier】` |

Silence is directed too. If you want no music or no speech, say "No music, no dialogue", and say it twice in long prompts (see the stability laws below).

## Dialogue

- The model's default spoken language is Chinese. Before every non-Chinese line, write `Dialogue language: <language and accent>.`, and declare it again at each speaker change.
- Order: language → accent → delivery → speaker → `{line}`. The delivery ("fast, nervous, almost laughing") shapes the performance more than any description of the face.
- Lock out ad-libs: "Only these lines are spoken; lips move only for the scripted lines."
- Budget: at most two lines of dialogue per 8 seconds.

## Binding references

- One reference = one subject. For each reference, state its role and what to ignore: "@Image1 defines the courier: face, red jacket, messenger bag. Do not use the background of @Image1."
- Exclusions are mandatory. Backgrounds and bystanders from a reference leak into the video unless you rule them out.
- Several angles of one subject: "All images define ONE <subject>. Only one appears on screen." Separate angle files work better than a collage.
- Binding strength: "must strictly follow" > "use for" > "reference for". Spend the strongest binding on faces.
- Priority when you are short of slots: characters → props → locations → style.
- Never write "@Image1–4 are four characters". Map each file to exactly one named subject.
- Check reference stills frame by frame before using them. A defect in a reference is copied into every shot.
- Motion reference: "@Video1 defines only the body motion, timing and camera path. @Image1 defines the character's identity and clothing. Do not copy the person, clothing or background of @Video1." Then list what to keep (rhythm, pose changes, interaction beats, shot order) and what to change (setting, lighting, mood).
- First and last frame: "@Image1 is the first frame … @Image2 is the last frame …", then describe one continuous action that explains every visible difference between them. Both frames must share an aspect ratio.

## Long takes and staging

- Treat 30 seconds as a story (setup → development → turn → resolution), not a long clip. Write consecutive stages with one main change each and an explicit end state.
- Template: `[Generation Goal] … [Stage 1] … End state: … [Stage 2] Continue from the previous stage … [Maintain Consistency] …`
- Give the camera one through-line across all stages, and give the music an arc.
- Inside a single generation, ask for hard cuts only when each cut changes both angle and shot size ("high-delta" cuts). Low-delta cuts render as short dissolves.
- In an extension, keep the segment one continuous take and put real cuts between generations. Open the extension prompt with a continuity contract: what the first frame inherits from the last frame (positions, palette, weather, motion direction).

## Timing

- Ranges (`0–6s`) are budgets, not edit points. Use an exact point (`at 20 seconds`) for one critical beat that must land.
- Ranges are consecutive and non-overlapping. Actions may land slightly early or late.
- Fill each budget sensibly: too little content leaves the model free to invent, too much causes cuts or dropped events. Never ask for rates ("three actions per second").

## Budgets

| Duration | Beats |
|---|---|
| 8 s | 3–5 |
| 15 s | 4–6 |
| 30 s | 6–9 windows with a real arc |

Per 8 seconds: at most 3 characters close together (6 if clearly separated), 4 destruction events, 1 power or effect type, 1 speed ramp and 2 lines of dialogue. Over budget, split the idea into several generations instead of compressing it.

## Stability laws

- A lock stated twice holds better than one stated once. Put critical bans in the action section and again in the closing locks.
- Numbers beat adjectives: "three candles, all lit, visible in every frame".
- Prose density is a failure factor. Cut adjectives before you cut techniques.
- One-way state: anything broken or moved stays that way.
- End mid-motion, not on a held pose, especially before an extension.
- Signature camera moves that keep getting skipped (dolly zoom, whip pan): pin them to exact time points.

## Symptom → fix

| Symptom | Cause | Fix |
|---|---|---|
| Two characters fuse or swap features | Bodies overlap and share pixels | Shorten overlap, separate silhouettes, keep the camera out of the overlap zone |
| Random cuts | Camera block has no order | Write the camera as a sequence, or declare "one shot, no cuts" twice |
| Shots morph into each other | Low-delta cuts | Change angle and shot size at every cut, or split into separate generations |
| Music appears uninvited | "No music" stated once | State it in the audio block and in the closing locks |
| Subject blurry at speed | Speed described with no other cue | Ban subject motion blur; carry speed with background streaks, wind and dust |
| Broken object repairs itself | No state direction | One-way state law; keep the object out of frame afterwards |
| Events skipped or rushed | Too many beats for the duration | Merge beats or lengthen the clip |
| Extra or duplicated people | Crowd blends into the cast | Lock the head count: "exactly four people" |
| Look drifts mid-clip | No style block, or vague location | Add a global style line and a concrete location |
| Garbled text | Exact text is hard for the model | Use `【 】` with short text, or plan to add text in post |
| Face drifts from the reference | Weak binding | Use "must strictly follow @ImageN" for the face, and a cleaner, front-lit reference |
| Character looks plastic or CGI | Studio refs, "perfect" descriptions | Name real flaws and a phone-camera look; use face crops from in-scene previews (see `motion-transfer.md`, `realistic-characters.md`) |
| Character stops singing or pulling faces | Face references have a closed mouth | Add a `FACE` line: expressions follow @Video1, references define identity only |
| Swap averages the previews or mixes beats | Previews not tied to time | Add a `TIMELINE` line: "3 s as in @Image2; …" |

## Before you generate

- Subject and main action are named.
- Every reference has a role and an exclusion; every subject maps to exactly one file.
- Each stage has one main change and one end state.
- Camera and emotion terms are paired with something visible.
- Critical locks appear twice.

## After the render

- Freeze-frame hands, faces, props and lettering.
- Check that each `< >` event lands on its action and that there is no unscripted speech.
- Check continuity of wardrobe, props, light direction and screen direction.
- Check that the identity matches its reference and that no reference background leaked in.

## Moderation

Jobs depicting real public figures, recognisable IP or graphic violence are blocked (`nsfw` / `ip_detected`). References pass an asynchronous IP scan. "IP check not finished" means wait a few minutes and resubmit unchanged.

## Sources

- Higgsfield, *Seedance 2.5: The Director's Workshop*: https://seedance-25-workshop.higgsfield.app/
- Higgsfield blog, *Seedance 2.5 prompting guide*: https://higgsfield.ai/blog/seedance-2-5-prompting-guide
- Higgsfield blog, *Seedance prompting guide* (2.0 formats: transformations, POV, fights, animation): https://higgsfield.ai/blog/seedance-prompting-guide
- CapCut Dreamina, *Seedance 2.5 Motion Reference Guide*: https://dreamina.capcut.com/seedance/seedance-2-5-motion-reference-guide
