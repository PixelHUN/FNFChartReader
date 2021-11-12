---
title: Creating a Character
---

<p align="center"> 
<a href=docs>Documentation</a>
</p>

---------------------------------

# Creating a Character

Implementing your character doesn't *require* modifying any source code, so even if you don't understand **GML** you'll have a fairly easy time implementing your character.
I'll use Mommy Mearest as an example.

Each character has it's own **image strip** which contains their animations.<br>
When putting the image strip together, you must follow a strict pattern in the order of the animations:<br>
1. Idle (7 Frames)
2. Sing Left (2 Frames)
3. Sing Right (2 Frames)
4. Sing Up (2 Frames)
5. Sing Down (2 Frames)

This will make the sprite have **15 frames** all together.<br>
Currently there's no support for alt-animations.

## Get your sprites ready

### Exporting your sprites

If you made your characters graphics in an external program (like *Adobe Animate*), then you'll have to export each of your animations as a PNG Sequence.

Here is Mom in Adobe Animate:<br>
![Mommy Mearest](https://user-images.githubusercontent.com/59181913/141492329-6137d18d-2d26-4bcb-95c3-a53f192d2471.png)

You can easily export the characters animations, by finding the animation sequence on the right, right clicking it and clicking Export PNG Sequence.

Mom's idle animation:<br>
![Mom Idle Export](https://user-images.githubusercontent.com/59181913/141492756-2894e3e7-eced-4092-923d-e104f5e8dcd8.png)

Export all your animations (Idle, Sing Left, Sing Right, Sing Up, Sing Down)<br>
It's a good practice to keep all your files organized, since we'll be doing some trickery with them.<br>
![Organized Files](https://user-images.githubusercontent.com/59181913/141493209-f125f054-46c7-45f1-bbae-fb10cd7f18fc.png)

### Deleting the unnecesary frames

FNF's graphics all run at 24 frames per second, however their characters actually use 12 frames a second doubled, meaning that every other frame in the animation is the same
as the frame before.
We can simply get rid of them.

Deleting every second frame, of Mom's idle animation:<br>
![Frame Deleting](https://user-images.githubusercontent.com/59181913/141494106-b927a0b5-5e2e-4027-b81f-68c58ef5c664.png)

Now we are left with 7 frames:<br>
![7 idle frames](https://user-images.githubusercontent.com/59181913/141494397-65f84ae5-67e2-401c-a53a-90ce9b180479.png)

For each singing animation, we will only need the first and the **third** frames of the animation.

Mom's down animation now only consists of **two frames**:<br>
![Mom Down Animation](https://user-images.githubusercontent.com/59181913/141495547-29b76602-100c-43cc-ba2a-dccfe5db2a3b.png)

If everything has been done correctly, we should have the required frames that are mentioned *above*.<br>
![15 Frames of Mom](https://user-images.githubusercontent.com/59181913/141495826-ba42d71b-990d-4185-a5f1-afaa99f38fa1.png)

And with that, your sprites are ready for the next step.
