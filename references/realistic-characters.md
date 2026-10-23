# Realistic characters and reference images

How to design an original character and generate the reference images a video model needs, so the person looks like a real human rather than a render. These rules apply to any image generator (GPT Image in ChatGPT or Codex, Nano Banana, Higgsfield Soul and others).

## What makes an image look generated

The default output is a symmetrical, evenly lit face with poreless skin, perfect hair and studio sharpness. Viewers read it as AI at once. Realism comes from naming the flaws a real photo has:

- **Face:** slight asymmetry (one eye a little lower), an imperfect nose, under-eye shadows, uneven eyebrows, an unposed or tired expression.
- **Skin:** visible pores, small moles, a few pimples or healing spots, faint acne marks, redness around the nose, peach fuzz, a light oily sheen on the forehead and nose, fine lines. No makeup, unless the character wears it.
- **Hair:** frizz, flyaways and a messy parting, not a salon finish.
- **Body and clothes:** a soft belly roll, creases, stretched or faded fabric, scuffed leather, scratched dull metal.
- **Camera:** an ordinary phone, a still from 720p video, soft focus, sensor noise, mild JPEG compression, a slightly blown window, warm white balance, a wide lens with a little edge distortion.
- **Light:** one real source, such as daylight from a side window or street lamps at night. One side of the face is darker and there is no fill light.
- **Setting:** a lived-in place with clutter: a chair covered in clothes, a cable on the floor, a cracked tile.

State the ban list too: no studio light, no retouching, no beauty filter, no smooth plastic skin, no perfect symmetry, no extra sharpness, no HDR, no bokeh.

Per OpenAI's prompting guide for GPT Image models, "photorealistic" switches on the photographic mode, photography terms steer the look better than "8K" or "ultra-detailed", and asking for pores, wrinkles and imperfections is what produces them. Words that suggest studio polish work against you.

## Structured (JSON) prompts

For a hero image of a person, a JSON-like prompt with separate blocks keeps the face, skin, setting and camera from blending into each other. OpenAI's guide lists JSON-like structures as one valid format; it does not rank them above prose, so use whichever your team can maintain. In practice the JSON version produced a much less "perfect" face than the same content written as prose.

```json
{
  "task": "Recreate image 1 as a new real photo with a different person and a different room.",
  "keep_from_image_1": "camera angle, distance, framing, the person's size in the frame, pose, limb positions, head angle",
  "subject": {
    "person": {
      "identity": "an original fictional character, an ordinary real <man|woman>, <age>, <origin>, not resembling any actor or celebrity; a normal face you would pass in a supermarket",
      "face_structure": "slightly asymmetric: left eye a little lower; <an imperfect nose>; <cheeks and chin>",
      "eyes_and_brows": "<eye colour>, faint under-eye shadows, uneven unshaped eyebrows",
      "skin": {
        "tone": "<skin tone>, not glowing",
        "texture": "visible pores on nose and cheeks; matte, faint oily sheen on forehead and nose",
        "imperfections": ["small moles", "one or two small pimples", "faint acne marks", "redness around the nostrils", "fine peach fuzz"]
      },
      "hair": "<colour and length>, a little frizzy, flyaways, not salon-styled",
      "makeup": "none",
      "expression": "unposed, neutral, a bit tired"
    },
    "body": "EXACTLY the same proportions, weight and shape as the person in image 1",
    "clothes": "the same clothes as in image 1, slightly wrinkled and worn"
  },
  "environment": {"room": "<a lived-in room>", "details": ["<a worn floor>", "<a chair covered in clothes>", "<a cable on the floor>"]},
  "lighting": "plain daylight from one side window, one side of the face darker, no fill light",
  "camera_and_post_processing": {
    "device": "a cheap phone propped on a shelf about 2 m away, recording vertical video",
    "image_quality": "a still from 720p phone video: soft, the face NOT sharp, slight motion blur, noise in shadows, mild JPEG smearing, slightly overexposed near the window",
    "forbidden": "no studio light, no retouching, no beauty filter, no plastic skin, no perfect symmetry, no extra sharpness, no HDR, no bokeh"
  },
  "output": "one photorealistic real phone video frame, vertical 9:16, no other text, no watermark"
}
```

Reuse the same `person` block for every image of that character. For a close-up face reference, change only the task, pose and camera ("a casual selfie at arm's length, slightly soft, visible noise").

## Same body, different stage

For before/after or progress videos, describe the body of each stage separately and tie it to its source frame: "EXACTLY the same proportions, weight and shape as the person in image 1; fills the frame as much as in image 1, not slimmer". Generators slim people down by default, so say "not slimmer" explicitly.

## A cartoon hero as a real person

1. **Collect real frames.** Get 3–5 frames from the cartoon itself (front, three-quarter, full body), not fan art. Image search pages hide the full-size URL. On Bing it is the `murl` field in the `m` attribute of each `a.iusc` link, readable from the page with a script.
2. **List the signature traits.** Write down what makes the character recognisable in silhouette: the proportions (head-to-body size, jaw shape, ears), the hair shape, facial hair, the costume colours. These traits matter more than eye colour.
3. **Describe a real person with those traits.** "The live-action version of the cartoon character in images 1–3, as if a real person had exactly that look … natural human anatomy." Keep the exaggerated proportions, but in a believable human range, and say what they must not turn into (for example "muscular, not fat").
4. **Expect a CGI look on the first pass.** Images made from cartoon references come out Pixar-like. Make them human in the next step, the scene previews, with the realism block and real light. Do not try to fix it in the studio sheet.
5. **Match the group.** When several characters share a frame, give them one shared realism block and the same light, and make them in one image first. A cast assembled from separate pipelines looks mismatched.

## Character pack layout

For a reusable character, generate:

1. **A scene photo**, vertical 2:3: the full body in a fitting place. Start the prompt with "Photorealistic photo, vertical 2:3. An original fictional character, a real photorealistic person, not resembling any real actor or celebrity:", then give age and build → face → hair → clothes top to bottom → pose → background → light.
2. **A reference sheet**, landscape 3:2, made from the scene photo: a 2×4 grid on a plain light-grey background with thin white gaps. The top row has full body front, three-quarter, profile and back. The bottom row has head-and-shoulders front, three-quarter, profile, and front with a big smile. Ask for no text or labels.
3. **Cropped refs**: cut the sheet at the white gaps into eight files, `01-full-front` … `08-face-smile`.

The sheet is good for identity and costume. For a video, prefer previews made in the target scene, and use sheet crops only as a backup.

## Editing an image instead of regenerating it

- To fix one thing: "Edit image 1 itself. Keep EVERYTHING exactly as it is: …list… Change ONLY one thing: …". Repeat the keep-list on every round, because the model drifts a little each time.
- When a pose is broken (a twisted body or a wrong grip), start from a good image of the same moment and change only what differs: "keep the body exactly as in image 1; change only the head: turned away from the camera".
- To swap a garment: name the garment, where its replacement comes from and what to remove ("NO cape; where the cape was, show the jacket and the belt").
- Paste source-specific overlays (captions, labels) back from the source frame with a luminance mask instead of asking the generator to redraw text.

## Practical notes

- Codex and similar CLIs generate 2:3 or 3:2. Center-crop vertical previews to 9:16 before you use them.
- Generate one image at a time and check each output. A batch can return a stale file or swap slots.
- A generator can hit a usage limit after a few images. Have a second generator ready.
- Never put a real person's name or a franchise name into the image prompt. Describe the character as original.
