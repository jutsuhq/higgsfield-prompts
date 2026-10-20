# Cinematic vocabulary for video prompts

Terms that video models understand, what each looks like on screen, and how to phrase it in a prompt. Definitions follow standard film-craft usage (StudioBinder, No Film School) and official model prompting guides (Google Veo, Runway, Kling, Higgsfield); sources at the end.

How to use camera terms in a prompt:
- Name the move, its direction and its speed, plus what triggers it in the action and where it ends: "as she turns, the camera slowly pushes in to a close-up of her eyes".
- One camera move per shot or segment is the safest. Chain moves only as an ordered sequence.
- For image-to-video, the image already sets the look and composition; spend the prompt on motion.
- If the tool has camera-path controls, use them and keep the prompt for content and style. Conflicting instructions cause unstable motion.
- Write signature moves as their visible result, not jargon alone. See the dolly zoom row below.

## Camera movement

| Term | What it looks like | Use it for | Prompt phrasing |
|---|---|---|---|
| Static / locked-off | Camera does not move | Performance-led moments, tension, deadpan | "locked-off camera, no camera movement"; state it twice and describe what moves inside the frame |
| Push-in (slow dolly in) | Camera creeps toward the subject | Realisation, rising tension, intimacy | "the camera slowly pushes in to a close-up as…" |
| Dolly out / pull-back | Camera moves away | Isolation, ending a scene | "the camera slowly pulls back" |
| Pull-back reveal | Retreating until hidden context appears | Twists, scale, punchlines | "pull back to reveal the whole room is flooded" |
| Truck | Camera slides sideways, parallel to the subject | Side-on tracking with parallax | "the camera trucks left alongside her" |
| Pedestal | Whole camera rises or sinks without tilting | Revealing over or under an obstacle | "the camera rises straight up over the wall" |
| Pan | Camera swivels left or right in place | Following action, revealing space | "slow pan right across the skyline" |
| Tilt | Camera pivots up or down in place | Height, awe, dominance | "tilt up from his boots to his face" |
| Crane / jib | Large sweeping vertical move | Grand openings and endings | "crane up and away from the crowd" |
| Orbit / arc | Camera circles the subject (fully or partly) | Hero moments, energy, menace | "a slow quarter orbit around her" |
| Tracking / follow | Camera travels with the subject | Immersion, chases, walk-and-talks | "the camera follows behind him, matching his pace" |
| Handheld | Natural operator shake | Documentary, chaos, intimacy | "handheld documentary camera, slight natural shake" |
| Gimbal / steadicam | Smooth floating movement while moving | Dreamlike glides, long takes | "smooth gimbal glide through the corridor" |
| Whip pan | Very fast pan with motion blur | Urgency, linking two subjects | "whip-pan right in a streak of motion blur to…"; pin it to an exact second if it gets skipped |
| Crash zoom | Very fast lens zoom | Comedy, shock | "sudden crash zoom onto his face" |
| Zoom (vs dolly) | Lens changes focal length; perspective does not change | Surveillance or retro TV feel | "slow optical zoom"; do not use "zoom" when you mean the camera moves |
| Dolly zoom (vertigo) | Subject stays the same size while the background stretches or shrinks | Disorientation, shock, realisation | "dolly zoom: her face stays exactly the same size while the room behind her stretches away" |
| Roll | Camera rotates around the lens axis | Dizziness, a world turning over | "the camera rolls 90 degrees as he falls" |
| Aerial / drone | High, smooth view over the landscape | Establishing shots, scale | "slow aerial glide over the forest" |
| FPV drone | Fast, low, acrobatic first-person flight | Kinetic action, flying through spaces | "aggressive FPV drone flight, skimming the canyon wall" |
| Rack focus | Focus shifts between depths during the shot | Redirecting attention without moving | "rack focus from the letter to the figure in the doorway" |
| POV | The camera is the character's eyes | Immersion | "first-person POV, natural head movement, no cuts, no zoom" |

## Shot size

| Term | Frame | Use it for |
|---|---|---|
| Extreme wide (EWS) | Subject tiny or barely visible | Place, distance, isolation |
| Wide / long (WS) | Whole subject with surroundings | Relation to the setting; establishing shots |
| Full (FS) | Head to toe | Action, physicality, costume |
| Medium (MS) | Waist up | Body language plus expression |
| Medium close-up (MCU) | Chest up | Dialogue, emotion |
| Close-up (CU) | Face or object fills the frame | Reactions |
| Extreme close-up (ECU) / macro | A single detail: an eye, a texture | Detail, ASMR, tension |
| Insert | Cutaway to a key detail | Clues, props, hands |
| Two-shot | Two people in one frame | Relationships |
| Over-the-shoulder (OTS) | From behind one person toward another | Conversation coverage |

## Camera angle

| Term | What it does |
|---|---|
| Eye level | Neutral and relatable |
| Low angle | Looking up; power, threat, scale |
| High angle | Looking down; vulnerability, smallness |
| Bird's-eye / top-down | Straight down; patterns, geography, detachment |
| Worm's-eye | Straight up from the ground; scale, dread |
| Dutch angle | Tilted horizon; unease (use sparingly) |

## Lens and focus

| Term | Look | Use it for |
|---|---|---|
| Wide 14–24mm | Expands space, exaggerates near objects, distorts faces up close | Interiors, establishing, kinetic closeness |
| 35mm | Natural with documentary closeness | Walk-and-talks, street scenes |
| 50mm | Close to human perspective | Neutral, honest coverage |
| Telephoto 85–135mm | Compresses space, flatters faces, separates the subject | Portraits, longing looks, heat-haze crowds |
| Anamorphic | 2.39:1 frame, oval bokeh, horizontal streak flares | An instantly "cinema" look |
| Macro | Extreme magnification | Product detail, textures, insects |
| Shallow depth of field | Thin sharp plane, blurred background | Isolating a subject |
| Deep focus | Everything sharp | Several layers of action at once |
| Bokeh | Quality of out-of-focus highlights | Night lights, romance |
| Soft focus / diffusion | Hazy glow over the frame | Dreams, memories |

Tip: Higgsfield's Seedance 2.5 guide pins lenses per segment by horizontal field of view plus camera distance (for example "47° normal lens, 2 m from the subject"). This holds better than focal length alone.

## Lighting

| Term | Look | Use it for |
|---|---|---|
| Three-point | Key, fill and back light | Clean, modelled subject |
| Key / fill / back | Main light / shadow softener / separation from the background | Describing a setup precisely |
| Rim light | Bright outline around the subject | Separation, drama |
| High-key | Bright, even, low contrast | Comedy, commercials, lightness |
| Low-key | Mostly shadow, hard light | Noir, thriller, horror |
| Chiaroscuro | Extreme light-dark contrast, often side light | Painterly drama |
| Hard light | Crisp-edged shadows | Graphic, harsh, silhouettes |
| Soft / overcast | Diffused, gentle shadows | Flattering, calm, melancholy |
| Practical lights | Lamps, candles or screens visible in the frame | Grounding and motivating the light |
| Motivated light | Light that copies a believable source | Realism |
| Silhouette | Backlit dark shape | Mystery, anonymity |
| Golden hour | Low warm sun, long shadows | Romance, nostalgia |
| Blue hour | Cool twilight | Calm, sadness |
| Neon | Saturated coloured practicals | Urban night, cyberpunk |
| Volumetric / god rays | Visible light shafts through haze | Atmosphere, the sacred |

## Film look and grade

| Term | Look |
|---|---|
| 35mm film | Organic grain, soft highlight roll-off, classic cinema |
| 16mm | Coarser grain, softer detail; indie and documentary |
| Super 8 | Heavy grain, colour shifts, gate weave, flicker; home movies |
| VHS / camcorder | Low resolution, chroma bleed, tracking lines; found footage, late 80s and 90s |
| Early-90s TV | Soft, interlaced, 4:3, video colour |
| Portra-style colour negative | Warm natural skin tones, gentle pastels |
| Ektachrome-style slide film | Fine grain, clean vivid colour |
| Cinestill 800T-style | Tungsten-balanced night with red halation around lights |
| Halation | Reddish glow bleeding around bright highlights |
| Teal-orange | Warm skin against cool shadows; blockbuster look |
| Bleach bypass | High contrast, desaturated, gritty |
| Letterbox 2.39:1 | Widescreen scope frame |

Texture cues that also work: gate weave, chromatic aberration, lens breathing, "unretouched skin", "no CGI sheen".

## Editing and pacing

| Term | What it does | Prompt phrasing |
|---|---|---|
| Hard cut | Instant switch between shots | "HARD CUT"; change angle and shot size at each cut so it does not dissolve |
| Match cut | Links two shots through a shared shape, motion or sound | "match cut from the spinning coin to the spinning wheel" |
| Jump cut | Jarring skip within the same framing | "jump cuts as he paces the room" |
| Cross-dissolve | One shot fades into the next | "slow dissolve to…" |
| Montage | Quick series of shots that compresses time | "a montage of six short shots…" |
| Speed ramp | Speed changes within one shot | "ramps into slow motion at the peak of the jump, then snaps back" |
| Slow motion | Stretches a moment | "120 fps slow motion" |
| Timelapse | Compresses hours into seconds | "timelapse of clouds racing over the valley" |
| One-take / oner | One continuous shot | "one continuous take, no cuts" |

## Negatives: model-specific

- Seedance and Higgsfield examples use explicit exclusions ("no music, no subtitles, no logos") and benefit from stating critical ones twice.
- Google's Veo guide advises against "no" or "don't" and instead lists unwanted elements in a separate negative field.

Follow the convention of the model you are prompting.

## Sources

1. Google Cloud, *Veo prompt guide*: https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide
2. Runway, *AI camera prompts*: https://runway.com/resources/ai-camera-prompts
3. Kling AI, *Prompt guide*: https://kling.ai/blog/kling-ai-prompt-guide
4. Higgsfield, *Seedance 2.5: The Director's Workshop*: https://seedance-25-workshop.higgsfield.app/
5. Higgsfield blog, *Seedance 2.5 prompting guide*: https://higgsfield.ai/blog/seedance-2-5-prompting-guide
6. Higgsfield blog, *Seedance prompting guide*: https://higgsfield.ai/blog/seedance-prompting-guide
7. StudioBinder, *Types of camera movements*: https://www.studiobinder.com/blog/different-types-of-camera-movements-in-film
8. StudioBinder, *Camera shot sizes*: https://www.studiobinder.com/blog/types-of-camera-shot-sizes-in-film
9. StudioBinder, *Focal length explained*: https://www.studiobinder.com/blog/focal-length-camera-lenses-explained/
10. StudioBinder, *Film lighting terms*: https://www.studiobinder.com/blog/film-lighting-terms/
11. No Film School, *Film lighting techniques*: https://nofilmschool.com/film-lighting-techniques-and-examples
