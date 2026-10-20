# 09 · Fix a failed generation

**Request:** "Two sword fighters merged into one person halfway through, and music appeared even though I didn't want any."

**Diagnosis** (symptom → cause → fix, from [`../references/seedance-2.5.md`](../references/seedance-2.5.md#symptom--fix)):

| Symptom | Cause | Fix |
|---|---|---|
| Fighters fused | Long body overlap with similar outfits | Strike and separate; contrasting silhouettes; at most 3 impacts per 8 s; camera outside the overlap |
| Uninvited music | "No music" stated once | State it in the audio block and in the closing locks |

**Changed lines** (the rest of the prompt stays the same):

```
<Lean> is a slim fighter in pale grey robes holding one straight sword; <Broad> is a heavy fighter in dark lacquered armour holding one curved blade. <Lean> stays on the left of the screen and <Broad> on the right at all times; they never swap sides.
Each exchange is one strike and an immediate separation: the blades meet once, ring, and both fighters slide back two paces with clear air between them. Three exchanges in total.
The camera stays at a three-quarter angle outside the space between them.
Audio: <one ringing blade contact per exchange> <boots slide in the gravel> <wind through the bamboo>. No music, no dialogue.
Closing locks: two fighters, identities constant, never overlapping for more than a moment; no music; the clip ends mid-motion.
```

**Why it works:** each fix targets the cause, not the wording. More "don't merge" lines make fusion worse because they compete with the action beats. Separation in space and time is what fixes it.
