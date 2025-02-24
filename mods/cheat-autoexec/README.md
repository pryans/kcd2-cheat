# Cheat-Autoexec
This is an example mod that houses an autoexec.txt file with console commands that will be run every time that gameplay starts; meaning when the playable character is loaded into an area.

- **Note 1:** This requires KCD2 Cheat mod version 2.11+
- **Note 2:** Before making changes just load this mod unchanged to make sure you know how to install a mod correctly.
- **Note 3:** It is very easy to corrupt the pak file, if it says the file is empty or gives a read error then the pak is corrupt.

## Setup
1. Unzip cheat-autoexec mod to KingdomComeDeliverance2\Mods
2. Edit KingdomComeDeliverance2\Mods\cheat-autoexec\data\scripts\cheat\autoexec.txt
3. Used >>> Windows Explorer Zip (win10) <<< (or get a corrupt pack file)
4. Zip KingdomComeDeliverance2\Mods\cheat-autoexec\data\scripts folder into cheat-autoexec.zip
5. Rename cheat-autoexec.zip to cheat-autoexec.pak
6. You should have structure:

```
KingdomComeDeliverance2\Mods
KingdomComeDeliverance2\Mods\cheat-autoexec\
KingdomComeDeliverance2\Mods\cheat-autoexec\mod.manifest
KingdomComeDeliverance2\Mods\cheat-autoexec\README.txt
KingdomComeDeliverance2\Mods\cheat-autoexec\data\cheat-autoexec.pak
KingdomComeDeliverance2\Mods\cheat-autoexec\data\scripts\cheat\autoexec.txt
```

7. Run game and look in KingdomComeDeliverance2\kcg.log to see if cheat-autoexec mod loaded.
```
    Look in kcd.log when the game loads to main menu for this:
        Pak 'mods\cheat-autoexec\data\cheat-autoexec.pak' is opened, root: 'data\'
    Look in kcd.log when a level loads for this:
	[INFO] Running Autoexec
	[INFO] Running command [cheat_no_lockpicking]
	etc...
```

8. Repeat steps 2+ every time you want to make a change to autoexec.txt
