# higgsfield-prompts

An agent skill that writes production-ready prompts for [Higgsfield](https://higgsfield.ai), mainly for Seedance 2.5 video. Give your agent an idea, a few reference images or a clip you want to recreate, and it returns a prompt ready to paste, with the reference mapping, the settings to pick and what to change if the generation fails.

It follows the [Agent Skills](https://agentskills.io) format, so it works in Claude Code and any other agent that loads `SKILL.md` skills.

## What it does

- Writes Seedance 2.5 prompts for every mode: text-to-video, omni-reference (images, video, audio), first and last frame, video edit and extension.
- Analyses a reference video (duration, cuts, contact sheet) before recreating it, instead of guessing.
- Builds multi-shot montages from stills with clean hard cuts, and 30-second one-takes staged so the second half doesn't drift.
- Directs sound and dialogue with Seedance's bracket syntax and language declarations.
- Describes characters and objects as original designs without names, so prompts pass moderation.
- Diagnoses failed generations (fused characters, uninvited music, random cuts, garbled text) with a symptom → cause → fix table.

## Install

Claude Code (personal skills):

```bash
git clone https://github.com/jutsuhq/higgsfield-prompts ~/.claude/skills/higgsfield-prompts
```

Claude Code (one project only): clone into `.claude/skills/higgsfield-prompts` inside the project.

Other agents: copy the folder into the agent's skills directory.

The video analysis script needs `ffmpeg`:

```bash
brew install ffmpeg
```

## Use

Ask in any language, for example:

- "Write a Seedance prompt to animate this photo, 5 seconds."
- "Repeat this TikTok with my character and my car."
- "Make one video out of these six frames."
- "Two characters arguing on a rooftop, different accents, 10 seconds."
- "The two fighters merged halfway through, fix the prompt."

Invoke it directly in Claude Code with `/higgsfield-prompts`.

## Contents

```
SKILL.md                     workflow the agent follows
references/seedance-2.5.md   model limits, formula, sound brackets, references, staging, repair table, QC
references/vocabulary.md     camera, shot, lens, lighting, film-look and editing terms with prompt phrasing
examples/                    nine worked requests with full answers
scripts/analyze-video.sh     duration, cut timestamps and contact sheet for a reference video
```

## Sources

The rules are condensed from Higgsfield's [Seedance 2.5 Director's Workshop](https://seedance-25-workshop.higgsfield.app/) and [prompting guides](https://higgsfield.ai/blog/seedance-2-5-prompting-guide), CapCut Dreamina's [motion reference guide](https://dreamina.capcut.com/seedance/seedance-2-5-motion-reference-guide), the official Google Veo, Runway and Kling prompting guides, and StudioBinder and No Film School for film terminology. Each reference file lists its sources. All example prompts were written for this repository.

Not affiliated with Higgsfield or ByteDance. Model limits change; check the Higgsfield UI when a number matters.

## License

[MIT](LICENSE)
