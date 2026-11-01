# Motion transfer and character swaps

How to recreate a source video with your own characters when the face, body and clothes must all change: Higgsfield Motion Transfer, Genjutsu in Jutsu Studio, or Seedance omni-reference with `@Video1` as the motion reference. Everything here was learned on real swaps. When a number matters, check the tool's UI.

## Limits to plan around

- Motion-transfer tools usually take a 4–15 s source and 1–10 images (Genjutsu Lite in Jutsu 0.2.6 takes 10). Seedance omni-reference takes up to 30 s.
- Cost is per second, so trim the source to the part that carries the joke: cut app outros, end cards and dead air before you upload.
- A source with cuts works if the prompt describes each shot with its time range. A single continuous take is the safest input.

## Choosing a source

Motion transfer keeps the source's motion, camera, timing and material and changes only who is in it. Before you spend on stills, reject a source that needs something it cannot do:

- **Broken source, broken result.** A hand passing through a prop, a morphing object or teleporting contact in the source comes through in the swap.
- **Material carries over.** Plastic, vinyl, clay or cartoon rendering in the source stays plastic, vinyl, clay or cartoon. A change of rendering style is a fresh generation, not a swap.
- **Hidden things have nothing to anchor to.** A person or object that is out of frame or covered for most of the clip comes out unstable. The swapped person should be visible and reasonably large most of the time.
- **Small faces lose their eyes.** The render's own resolution sets how much eye there is. Measure the face width in the source scaled to the render's short side (480 px for a 480p draft): from about 130 px the eyes hold; 80–130 px they go soft and light irises smear; below 80 px they break in every prompt (dark empty sockets, white blobs for irises, two different eye colours, pupils looking apart). An upscaler does not bring them back. Crop the source tighter around the swapped people, render at a higher resolution, or pick another source.
- **Fast blur and heavy occlusion** (crowds, hands over the face, spins) are where faces drift. Trim to the part where the face is readable.
- **Action, line or camera cannot change.** A new move, a new angle or new words mean a new generation.

## The preview-frame pipeline

A swap follows the preview stills more than the prompt text, and every still is a fresh guess at each face. Make as few stills as cover the clip: usually one anchor per shot.

1. **Analyse the source.** Run `scripts/analyze-video.sh` and look at the contact sheet. Pull the keyframe of each shot with `scripts/keyframes.sh <video> 0.5 …`: the clearest moment where the swapped people face the camera.
2. **Map roles.** Name every person in the source by position and clothing ("the man in the white shirt on the right") and assign one target character to each. Use the same mapping words in the preview prompt and in the video prompt.
3. **Make one anchor still per shot.** The keyframe is image 1, then one canon face image per character, nothing else: no full-body sheets, no extra references. "Copy image 1 exactly … replace only the man …", with every swapped person together in the same still and the prompt under about 1500 characters. Seven inputs and a long prompt make the generator blend the characters.
4. **Add a still only for what the anchor cannot show**: an outfit change during the clip, a back view, a person who enters later. Each extra still gets its keyframe plus the anchor: "Replace only the people with the people from image 2 (same faces, same clothes) … whoever is not visible in image 1 must not appear." Do not add stills for every pose change: with four stills there are four versions of each face, and they have to be matched again by hand.
5. **Compare.** One grid with the keyframe, the anchor and each character's face image. Check face, hair, eye colour, garments, pose, size in the frame.
6. **Fix single frames.** When the frame is right except one detail (a hand, a garment colour, a prop, a scar), make a point edit instead of a new still: the preview as the only input image, and a prompt that names the one change and keeps everything else ("Change only her left hand: five fingers wrapped around the cup handle. Keep everything else in the image exactly as it is."). Keep it to one or two edits. Regenerate the anchor when the pose, framing or identity is wrong, with the reason written into its prompt. Move rejected versions to an archive folder instead of deleting them.

Some generators return a stale image or put the result in the wrong slot, so open every output before you use it.

## Upload order

Anchor stills first, in timeline order, then one face image per character:

| Tag | File |
|---|---|
| @Video1 | trimmed source |
| @Image1–2 | anchor stills, one per shot, in time order |
| @Image3–4 | canon face image, one per character |
| (optional) | full-body front view, only when the anchor does not show the character in full and the clip does |

The face reference is the character's canon face image, not a crop from a preview: the anchor already carries the light and realism of the scene, and a second face per character gives the model two identities to average.

Every image gets exactly one job: a moment of the timeline, a face, a garment or a prop. An image that does two jobs leaks: the background or light of a face reference bleeds into the scene, the light of a prop shot into the skin. Use as few images as do the job; each extra one dilutes the others. Props, hats and helmets are their own images, attached only when they are on screen, never baked into the face reference.

## Prompt skeleton

```
Recreate @Video1 exactly: the same single continuous handheld vertical shot in the same <place>, the same camera moves, framing and timing. No cuts. Only <who> changes.

<ROLE> (the <clothing and position of the person in @Video1>) becomes the <character> from @Image1: an original fictional character, <age and build, the same height and size in the frame as the person in @Video1>, <face>, <hair>, <clothes top to bottom>. The face must strictly follow @Image3.
Take only the person from @Image3: not its background, framing or light.

PROPS: <what replaces branded or risky objects>.
MOTION: <the actions in order, "copy every movement of @Video1 with the same energy and timing">.
TIMELINE: 0.5 s as in @Image1; 3 s as in @Image2; …
FACE: <expressions following @Video1>. The reference images define only identity, face and clothing, never the expression. Both eyes of each person: the same <colour> iris in both eyes, round pupils centred in the iris, both eyes look at the same point. Gaze direction, blinks and squints follow @Video1: when the eyes in @Video1 close or narrow, the eyelids close the same way, no half-open eyes with drifting irises.
LOOK: <the capture block: phone and its position, the named light sources, grain and compression, skin texture, the lived-in clutter of the place>.
Audio: keep the original audio of @Video1.

LOCKS: one continuous shot, no cuts, motion, timing and framing identical to @Video1. Exactly <N> people, each always in their own clothes and place. Faces strictly follow @Image3 and @Image4. No <the source's clothing>, no tattoos, no jewellery, no logos.
```

- The `TIMELINE` line ties each still to its moment. With one anchor per shot it names the shot; without it the model averages the stills.
- The `LOOK` line is a capture block written once per project and pasted byte for byte into every preview prompt and the video prompt. The same words every time keep previews and video looking filmed by the same phone; a reworded block drifts toward a clean, catalogue look.
- The eye sentence in `FACE` is there because a blink, wink or squint in the source otherwise comes out as half-open eyes with the irises drifting apart, and a light canon eye colour drifts to two different colours.
- The `FACE` line is needed because face references usually have a closed mouth. Without it the character stops singing, laughing or pulling faces.
- "Keep the original audio" plus no dialogue lines avoids an invented soundtrack. Mixing the original sound back in during editing is the most reliable option.

## Failure → fix

| Failure | Cause | Fix |
|---|---|---|
| Character comes out taller, bigger or more heroic than the person in the source | Heroic descriptions ("enormous", "towering") and full-body studio refs | Write "ordinary height, the same height and size in the frame as the person in @Video1", put it in the LOCKS too, and remake previews at the source's scale |
| A cloak, cape or loose scarf jumps sides when the person turns | Free-hanging garments have no stable side; front and back previews disagree | Remove them from the design ("NO cloak") in every preview and in the prompt |
| Outfit changes mid-clip (garment length or type) | A preview misread what a garment in the source is, or a style ref overrode the source | Check every garment in the keyframe before writing. Say which garment comes from which image ("the trousers from the original, not from the reference") |
| Body faces the camera while the head is turned 180° | The model kept the face visible in a back view | Remake that preview from a good preview of the same moment and change only the head, or describe "whole body turned away: back, shoulders, hips and feet all face away" |
| Hands hold each other wrongly or have extra fingers | The grip was described in words only | Copy the grip from the keyframe: "the hands hold each other exactly as in image 1", "five fingers each" |
| Source tattoos, jewellery, watches or logos come back | They are part of the motion source | Ban them by name in every preview and in the LOCKS; replace branded packaging with plain packaging |
| Text burned into the source (captions, labels) disappears in some shots | The model treats text as optional | Keep it in each preview (paste it back from the keyframe if the generator drops it), mention it in the prompt, or add it again in editing |
| Readable signs or banners in the background | Real text and brand risk | "Any text on the banner is blurred and unreadable" |
| One character looks like CGI next to two real-looking ones | Refs from different pipelines | One shared realism block for all characters; face crops from the same preview set |
| Rejected for a resemblance to real people | A source with recognisable actors, or a ref that resembles one | Never upload source faces; upload only your previews and crops; make the character clearly original |
| Eyes are mush, empty dark sockets or white blobs; two different eye colours | The face is under about 80 px wide at the render's resolution, so there is no room for an iris | Measure the face before the stills; crop the source tighter, render at a higher resolution or pick another source. A prompt line does not fix it |
| Half-open eyes with irises drifting apart | A blink, wink or squint in the source | The eye sentence in `FACE`; check those moments on an eye strip |
| Upscaled video has painted-looking eyes, jagged white highlights | The upscaler invents detail where the draft had none | Compare eye strips of the draft and the upscale at the same moments before delivery |
| Faces, hair or headwear differ from still to still | Each still invented the face on its own | One anchor per shot; extra stills only for an outfit change, a back view or a late entrance |
| Short glitch on one body part (a ghost limb, a prop changing colour) | Overlapping limbs during fast motion | Find the frames on a 10–30 fps strip and cut that span during editing (see below); a reroll costs the full price again |

## Repairing a finished render in editing

- Find the glitch: `ffmpeg -ss <t> -i out.mp4 -t 1.2 -vf "fps=15,crop=iw/2:ih/2:iw/2:ih/4,scale=200:-1,tile=8x3" strip.jpg`. Crop to the region; full frames hide small artifacts.
- Look a little before and after the span the viewer points at. The same artifact often lasts longer than it seems at full size.
- Cut the whole span, placing the cut on fast camera motion, and crossfade the audio over about 30 ms:
  `[0:v]trim=0:A,setpts=PTS-STARTPTS[v1];[0:v]trim=start=B,setpts=PTS-STARTPTS[v2];[v1][v2]concat=n=2:v=1:a=0[v];[0:a]atrim=0:A,asetpts=PTS-STARTPTS[a1];[0:a]atrim=start=B,asetpts=PTS-STARTPTS[a2];[a1][a2]acrossfade=d=0.03[a]`
- Check the result with a strip around the cut.

## Checking a render

- A contact sheet at 2 fps for the whole clip, and 10–30 fps strips around turns, contact and fast motion.
- Eyes: crop both eyes of each face at 8–12 moments (close-ups, turns, blinks, the smallest face) from the source, the draft and the upscale side by side. Both eyes the same colour, pupils centred and looking the same way, blinks where the source blinks.
- Same person throughout, nobody swaps places, clothes do not change, the size in the frame matches the source, nothing from the source person leaks back (tattoos, logos, a hoodie).
