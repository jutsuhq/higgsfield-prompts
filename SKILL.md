---
name: higgsfield-prompts
description: Write production-ready prompts for Higgsfield video and image models, mainly Seedance 2.5 (text-to-video, omni-reference with images, video and audio, first/last frame, video edit, extension) and Higgsfield's motion-transfer and swap tools. Use when the user wants a video or image prompt for Higgsfield or Seedance, wants to animate photos, recreate a reference video with new characters or objects, build a multi-shot montage from stills, write dialogue or sound for a clip, fix a failed generation, or describe a character, object or scene for a prompt.
license: MIT
---

# Higgsfield prompts

Turn the user's idea, reference images and reference videos into a prompt they can paste into Higgsfield. Explain in the user's language; write the prompt itself in English, in one fenced code block.

Read as needed:
- [`references/seedance-2.5.md`](references/seedance-2.5.md): model limits, the base formula, sound brackets, dialogue, reference binding, staging, timing, budgets, symptom → fix table, QC checklists.
- [`references/vocabulary.md`](references/vocabulary.md): camera moves, shot sizes, angles, lenses, lighting, film looks, editing terms, with prompt phrasing.
- [`examples/`](examples/README.md): worked answers for each common request. Before writing, open the example closest to the request.

## 1. Understand the inputs

- **Reference video**: never guess what is in it. Run `scripts/analyze-video.sh <file>` (needs ffmpeg). It prints duration, resolution and cut timestamps and writes a contact sheet; look at the sheet. Note shot count, timing per shot, camera, framing, lighting and grade, aspect and letterboxing, and what happens.
- **Reference images**: the upload order defines `@Image1`, `@Image2`, … Keep a mapping from tag to file.
- **Missing pieces**: if the user refers to a file you cannot see, look for recently added files where they usually save downloads before asking.

## 2. Pick the mode

| Goal | Mode |
|---|---|
| Idea only, no references | Text-to-video |
| Animate a photo, cast characters, locations or props from images | Omni-reference (the first image can be the first frame) |
| Get from one still to another | Omni-reference with first and last frame |
| Copy a source video's motion, camera or timing with a new character | Omni-reference with `@Video1` as the motion reference, or Higgsfield's motion-transfer tool |
| Change one element of a finished clip | Video edit |
| Make a clip longer | Video extension |
| Change only clothing or an object while the person stays | A swap / object-swap tool; if the face must change too, use motion transfer instead |

## 3. Answer format

1. One line: what the source or idea is.
2. A table `Tag | File` for every reference, in upload order.
3. Settings to choose in the UI: mode, aspect ratio (9:16 for vertical social video, 16:9 or 21:9 for landscape), duration (4–30 s). Keep settings out of the prompt itself.
4. The prompt in a code block.
5. Two or three short notes: what to change if the generation is rejected, cuts badly, drifts or garbles text.

## 4. Write the prompt

Base formula: `[Subject + Action] + [Scene] + [Visual style] + [Camera] + [Audio]`, then closing locks.

- **Subject + action**: a concrete action with a beginning and an end.
- **Camera**: an ordered sequence; each move has a trigger in the action. Use the terms in `references/vocabulary.md`.
- **Audio**: `( )` for music, `< >` for each sound effect tied to its action, `{ }` for dialogue, `【 】` for on-screen text. Declare the language before every spoken line (`Dialogue language: British English.`); the default spoken language is Chinese. If you want silence, say so ("No music, no dialogue").
- **References**: one reference = one subject, with its role and an exclusion ("Do not use the background of @Image1"). Spend "must strictly follow" on faces.
- **Multi-shot**: timed shots (`Shot 1 (0–2s), @Image1: …`) whose ranges add up to the duration, one action each. For clean hard cuts, change both angle and shot size at every cut.
- **30 seconds**: stages with one main change each and an explicit end state, a camera through-line and a music arc.
- **Budgets**: 3–5 beats per 8 s, 4–6 per 15 s, 6–9 windows per 30 s. Over budget, split the idea into several generations.
- **Locks**: state critical constraints twice, once in the body and once in the closing locks. Use counts instead of adjectives, and end mid-motion.
- Keep the prose lean. Dense, adjective-heavy prompts fail more often than plain ones.

## 5. Content and policy

Higgsfield blocks real public figures, recognisable copyrighted characters and graphic violence. It also scans references for IP. Write prompts that stay inside those rules:
- Describe characters as **original fictional characters** by appearance, not by name. Do the same for places, vehicles and products.
- Do not name actors, celebrities, brands or franchises in the prompt. Remove logos and crests from reference images.
- If a reference is rejected as resembling a real person, the reference itself is the problem. Make the character clearly original (different age, face shape and features) and regenerate the image. Do not try to get a real person's likeness past the check.
- Readable text (licence plates, signs, newspapers) often comes out garbled. Default to "unreadable", or use short `【 】` text and plan to add exact text in post.

## 6. Describing a character, object or scene

Write one English paragraph.

- **Characters**, in this order:
  1. Age and build
  2. Face
  3. Hair
  4. Clothing from top to bottom, with colours and fit
  5. Pose
  6. Expression
  7. Setting and light
- **Objects**, in this order:
  1. Era and type
  2. Colours
  3. Front
  4. Profile
  5. Rear
  6. Wear

After the paragraph, add a short note on what was left out (names, brands, text) and on the one or two traits that make it recognisable, to strengthen if the model drifts. See `examples/08-describe-a-character.md`.

## 7. Fixing a failed generation

Ask for, or look at, the symptom. Find its cause in the symptom → fix table in `references/seedance-2.5.md`, then change only the lines that address it. Do not just reroll or pile on "don't" lines. See `examples/09-repair-a-failed-generation.md`.

## 8. Generating reference images

When the user needs a character sheet, first frame or set of stills, use whatever image generator is available. Save each image beside its prompt text, for example `NN-name.png` with `prompts/NN-name.txt`. For a batch, generate the images one at a time. Then review them together as a contact sheet (`ffmpeg -pattern_type glob -i '*.png' -vf "scale=420:-1,tile=4x5" -frames:v 1 sheet.jpg`). Before the user spends credits on video, freeze-frame check them: hands, faces, extra objects, lettering. A defect in a reference is copied into every shot.
