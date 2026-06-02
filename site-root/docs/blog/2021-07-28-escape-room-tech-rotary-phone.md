---
title: "Escape Room Tech - Rotary Phone"
date: 2021-07-28
author: Effex
tags: []
draft: false
---

One of my interests, that I've had to ignore over the last year and a half for obvious reasons, is Escape Rooms. They're like a slice of a video game, transplanted into real life. And I've succeeded at most of them that I've attempted. I admit. Humbly.

But my interest extends a bit further than just playing these rooms.

For a while now, I've been interested in the actual contents of them. They mostly use mechanical means to create puzzles. Primarily in the form of locks. Locked doors. Boxes. But a couple have used digital means, and it got me thinking a lot about items that could be used in escape rooms.

One idea I had was to repurpose an old rotary phone.

[An image is missing]()

I ripped out the original PCB. The phone itself is from the 60s, so the PCB was thick, brown. Looked handmade. The tracks were very visible and components were attached with screws. Quite different from modern devices, but it was interesting to see.

Inside the phone, there were two things I was interested in attaching to a Raspberry Pi. The rotary dial and the hook switch.

The hook switch is a complicated device, as demonstrated by the original wiring schematic:

[Image missing here, too. lazy dev]()

But I didn't really care about any of that. I was interested in two things: whether the hook switch was down, indicating the handset was in resting position, or up, handset having been lifted. From the ~11 terminals attached to the hook switch, I identified two of them that would let me know all this information, soldered a couple of wires to them and connected them to the Raspberry Pi's GPIO. Easy.

Next is the rotary dial. A device that you might not even know existed, or know how to use, if you're not an ancient fuck like I am. Basically, you put your finger in the hole of the number you want to dial, rotate it clockwise until you reach the barrier, and then release.

To see how this functions, we need to look at the four wires. There are two circuits in the rotary dial. I don't know the actual names, so I'll call them the state circuit and the pulse circuit. Things happen in a specific order, when you rotate the dial.

1. The state circuit opens
2. The pulse circuit opens and closes once for each number you've dialled
3. The state circuit close

We wait for the state circuit to open, count the pulses we receive until the state circuit closes. It's that simple.

I wrote a small piece of software that you can find [here](https://github.com/0xEFX/rotary-phone). It acts as a driver for the rotary system. From that launching point, it would be easy to write a piece of software that listens for a password, resetting using the hook switch.

I also inserted a soundcard, ran a sound cable to the handset, and am searching for a small enough speaker to run inside the device. Then you can send messages with it too.

This is how I waste my time.
