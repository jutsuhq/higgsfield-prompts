# 04 · Repeat a viral clip with your character

**Request:** "Repeat this TikTok, where a guy pulls up in a car next to the camera and says something smug, but with my character and my car, flying in over a castle."

First run `scripts/analyze-video.sh clip.mp4`. Here it reports 8.4 s with no cuts: one handheld take. A car approaches, stops beside the camera, and the driver turns to the lens.

| Tag | File |
|---|---|
| @Image1 | `driver.png`: a lanky freckled teenager with messy ginger hair in a dark school sweater |
| @Image2 | `car.png`: a pale-blue vintage compact car with a cream roof |
| @Video1 | `clip.mp4`: the source TikTok |

**Settings:** omni-reference, 9:16, 8 s.

```
@Video1 defines only the camera behaviour and timing: one handheld documentary-style take where a car approaches and stops right beside the camera, then the driver turns to the lens. Do not copy the person, the car, the street or the clothing of @Video1.
@Image1 must be strictly followed for the driver: an original fictional teenager with a lanky build, dense freckles, light blue eyes, messy copper hair and a dark V-neck sweater over a cream shirt. Do not use the background of @Image1.
@Image2 defines the car: a pale powder-blue vintage compact with a cream roof, round chrome headlights and a wide chrome grille, with worn paint. Do not use the background of @Image2. The licence plate is unreadable.

One continuous handheld take. The camera points up at grey sky above an ancient gothic castle on a misty lake. The blue car swoops down out of the clouds with its engine sputtering, touches down on the grass with a small bounce, and rolls up to stop right beside the camera. The camera swings to the open driver's window; the driver pulls the handbrake, rests his elbow on the door, and turns to the lens with an overly proud grin, hair windswept.
Dialogue language: casual British English. The driver says, smug and offhand: {Need a lift?} Only this line is spoken.
Audio: <wind rushing past> <the old engine coughs and rattles> <tyres thump onto the grass> <the handbrake creaks>. No music.
One shot, no cuts. The driver matches @Image1 and the car matches @Image2 throughout. No subtitles, no logos, no watermarks.
```

**Why it works**

- Each reference has one role and an explicit exclusion. Without "do not copy the person", the source actor leaks in.
- The character is described as original, by appearance. Names of franchises or actors trigger moderation.
- The model can't read the plate reliably, so it is made unreadable on purpose.
- The dialogue has its language declared and is locked to one line.
