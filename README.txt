Subgame for the Minetest engine.
Community approach on trying to recreate the unreleased UFOrace by Kenny.
See https://forum.minetest.net/viewtopic.php?f=50&t=12391

At the moment unusable. Just trow in the code we need.


#
# Todo
#

	Basic features (current focus):
		Hide the default UI and inventory
			Show it in creative
		1 block high player model and properties
		Mod to handle level start, end and teleportation to new levels
			Respawn at start when falling of level
		Creative mode to build the levels
			Fly by default

	Additional features (nice to have - later):
		Special blocks: jump pads
		Background music and sound effects
		Creative mode:
			Ingame switching


The hard part is not to add to much.

#
# In progress
#
 
	Some mod to place nodes in thin air (Mapgen singlenode)  - by cd2 (cdqwertz)

#
# Done
#

	Jump 2 blocks high - by cd2 (cdqwertz)
	Mapgen singlenode - by cd2 (cdqwertz)
	Some decorative blocks with nice abstract textures (OCD) - by cd2 (cdqwertz) - I dont know if you think that they are nice XD, I like them 
	

#
# Mod structure
#

uforun
	Provides only initial variables, functions and settings, no nodes.

testing
	All the things that are necessary for testing but not part of the future game.

creative
	Build the levels.


#
# License
#

License of source code:
-----------------------
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2.0 of the License, or
(at your option) any later version.

https://www.gnu.org/licenses/gpl-2.0

License of media (textures and sounds)
--------------------------------------
Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)                                 
http://creativecommons.org/licenses/by-sa/3.0/

Authors of media files
-----------------------
Everything not listed in here: CC-BY-SA

Casimir (CC-BY-SA):
  icon.png
