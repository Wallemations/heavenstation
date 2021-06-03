# Guide from Jollystation

## MODULES AND YOU:

So you want to add content? Then you've come to the right place. I appreciate you for reading this first before jumping in and adding a buncha changes to /tg/ files.

We use module files to separate our added content from /tg/ content to prevent un-necessary and excessive merge conflicts when trying to merge from /tg/.

What does this mean to you? This means if you want to add something, you should add it in THIS FOLDER (modular_heaven) and not in ANY OF THE OTHER FOLDERS unless absolutly necessary (it usually isn't).

# What if I want to add...

## ...icons to this fork:

ALWAYS add icons to a new .dmi in your module's folder. Icons are notorious for causing awful terrible impossible-to-resolve-easy merge conflicts so never ever add them to normal codebase .dmi files.

## ...a one-off object, datum, etc. to this fork:

Create all new content in a new .dm file in the `modular_heaven/modules` folder. If your addition is a character-specific item, please put it in the `modular_heaven/modules/characters` folder in its own specifically named folder. Furthermore, try and follow normal TG pathing.

VERY IMPORTANT:

After you make your new folder with your new .dm file, you need to add it to OUR dme. DO NOT ADD IT TO TGSTATION.DME. You need to add it to heavenstation.dme in alphabetical order - VSCODE will do this automatically if you tick the file.

## ...a minor change to a pre-existing object, datum, etc.:

If you want to add a behavior to an existing item or object, you should hook onto it in a new file, instead of adding it to the pre-existing one.

For example, if I have an object `foo_bar` and want to make it do a flip when it's picked up, create a NEW FILE named `foo_bar.dm` and add the `cool_flip` proc definition and code in that file. Then, you can call the proc `cool_flip` from `foo_bar/attack` proc in the main file if it already has one defined, or add a `foo_bar/attack` to your new file if it doesn't. Keep as much as possible in the module files and out of /tg/ files.

## ...big balance/code changes to /tg/ files:

Oh boy. This is where it gets annoying.
Modules exist to minimize merge conflicts with the upstream, but if you want to change the main files then we can't just use modules in most cases.

First: I recommend trying to make the change to the upstream first to save everyone's headaches.
If your idea doesn't have a chance in hell of getting merged to the upstream, or you really don't want to deal with the upstream git, then feel free to PR it here instead, but take a few precautions:

- Keep your changes to an absolute minimum. Touch as few lines and as few files as possible.

- Add a comment before and after your changed code so the spot is known in the future that something was changed.
Something like so:
```
var/epic_variable = 3 // NON-MODULE CHANGE
```

```
/* NON-MODULE CHANGE:
/obj/foo/bar/proc/do_thing()
	to_chat(world, "I added a proc to something")
	qdel(src)
NON-MODULE CHANGE END /*
```

## ...custom things to vendors:

Uhhhhhhhh... Unless someone forgot to update this section of the README, the easy way to add contents to pre-existing vendors isn't implemented yet. Go yell at the coder monkeys to do it.

## ...defines:

Defines can only be seen by files if it's been compiled beforehand.
- Add any defines you need to use across multiple files to `modular_heaven/_module_DEFINES`
- Add any defines you need just in that file to the top of the file - make sure to undef it at the end.
- Add any defines you need to use in core files to their respective core define files, but be sure to comment it.

# Important other notes:

This module system edits the launch.json and the build.bat files so VSCODE can compile with this codebase. This might cause problems in the future if either are edited to any extent. Luckily the vscode edits are not necessary for compiling the project and and reasy to redo, so just overrite the changes if it causes conflicts.

# Upstream merge:

The time has come for doom. Pull from upstream and pray. Things will probably be broken. Try to fix as many as possible. Merge conflicts will be likely. Try to solve them sensibly.

Everything should be set to try to compile. If there are errors, try to solve them. If it compiles and the game itself seems wonky, then probably call your local coder and cry.
