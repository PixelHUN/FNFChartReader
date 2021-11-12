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

## Getting your sprites ready

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

## Creating the Image Strip

*Example of an image strip: (containing Dad's animations)*<br>
![dad_strip](https://user-images.githubusercontent.com/59181913/141497333-df7addd6-a07c-4c93-ae7d-0906a7e650ec.png)

The easiest way of creating our image strip is to do it inside Game Maker: Studio 2.
You can do this inside the FNF Chart Reader project, or inside your own project.

### Create a new sprite and Import the frames

First we'll create a sprite that we can import our frames into.
Using the import button we can import **all** frames into the editor.<br>
![new sprite](https://user-images.githubusercontent.com/59181913/141497926-1af41478-d5b9-4b00-95ee-9af4eba560b5.png)
![selected frames](https://user-images.githubusercontent.com/59181913/141498077-3526fa96-076f-4c7f-aca7-747881403d94.png)

When given the option to resize the image, select **Resize Canvas**, and choose a size that would fit all of your sprites.

*750x850 should be big enough for all Mom's frames*<br>
![size](https://user-images.githubusercontent.com/59181913/141498320-ad87ce5b-13ef-430f-b7c8-527bd84556bc.png)

Now it's time to reorder our frames to match the order mentioned *above*.<br>
(Idle, Sing Left, Sing Right, Sing Up, Sing Down)<br>
![correct order](https://user-images.githubusercontent.com/59181913/141498823-4f58212f-ce2e-4a14-92d7-ae2a15131e9c.png)

After everything is done, click on **Image** and click Export to PNG. You can export it straight into the project folder, or back into the folder where you stored your characters sprites.<br>
![export](https://user-images.githubusercontent.com/59181913/141499059-80634d42-538c-4f03-8574-ee3fbc88bc1c.png)
![mom_strip.png](https://user-images.githubusercontent.com/59181913/141499356-fdfb35c0-e6b5-4d5e-a941-23c89a108ec7.png)

### Making the image strip readable for the game

Open up the project (if you have built the game before open up the game's folder, and navigate into the assets folder), click on the hamburger menu icon in the **Asset Browser**
and click **Included Files**.<br>
![included files](https://user-images.githubusercontent.com/59181913/141499982-551d41c2-08ee-42ab-a010-100b187c1f1d.png)

This will open up a little window, just click Open In Explorer, and navigate into the assets folder.<br>
![open in explorer](https://user-images.githubusercontent.com/59181913/141500084-31159229-04d7-4a9b-b8f6-9ea948c37196.png)

Navigate into sprite/characters and put your image strip here.<br>
**Make sure it's called** ***yourcharactername_strip*** **and it's extension should be .png**<br>
*Now Mom's image strip is sitting next to all the other characters strips.*<br>
![mommy file](https://user-images.githubusercontent.com/59181913/141500630-06704316-28f0-4951-9bf2-969825259424.png)

And with that the graphical part is now ready for your character!

## The Character File.

Each character has it's own character file. It's necessary to have, since it's used for storing all the information about your character.

### Creating a Character File for your own character

Navigate to assets/characters and create a new .txt file with it's name being your characters name.<br>
*Mom's character file sitting next to all the other character files.*
![mom file](https://user-images.githubusercontent.com/59181913/141501396-aa9b71cb-01bb-471a-b66e-22e6b741e735.png)

A Character File stores information about that specific character. Each line is a new piece of information.
1. Image Strip Name (the name of the image strip in assets/sprite/characters)
2. Frame Count (how many frames does the image strip have)
3. Sing Left Animation Offset (x offset **comma** y offset)
4. Sing Right Animation Offset (x offset **comma** y offset)
5. Sing Up Animation Offset (x offset **comma** y offset)
6. Sing Down Animation Offset (x offset **comma** y offset)
7. Camera X Offset (how many pixels should the camera be offseted on the x when focusing on the character)
8. Camera Y Offset (how many pixels should the camera be offseted on the y when focusing on the character)

*Mom's character file:*
![charfile](https://user-images.githubusercontent.com/59181913/141502542-da104fec-4da7-4b29-9485-944735901779.png)

--------

If everything has been set up correctly, your character should now work in game!
