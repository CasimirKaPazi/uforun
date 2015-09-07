Subgame for the Minetest engine.
Community approach on trying to recreate the unreleased UFOrace by Kenny.
See https://forum.minetest.net/viewtopic.php?f=50&t=12391

At the moment unusable. Just trow in the code we need.


#
#Todo
#

	Basic features (current focus):
		Hide the default UI and inventory
			Show it in creative
		Mapgen singlenode
			Some mod to place nodes in thin air
		Jump 2 blocks high
		Some decorative blocks with nice abstract textures (OCD)
		1 block high player model and properties
		Mod to handle level start, end and teleportation to new levels
		Creative mode to build the levels
			Fly by default

	Additional features (nice to have - later):
		Special blocks: spices, jump pads, cushions
		Background music and sound effects
		Creative mode:
			Ingame switching

The hard part is not to add to much.


#
# Mod structure
#

uforun
	Provides only initial variables, functions and settings, no nodes.

testing
	All the things that are necessary for testing but not part of the future game.

creative
	Build the levels.
