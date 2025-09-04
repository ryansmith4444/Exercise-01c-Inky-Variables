/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/






VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR has_orb = false
VAR bravery = 0



-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you. The cave might be less intimidating then. What is your pets name?

* [Charlie]
~ pet_name = "Charlie" 
-> cave_mouth
* [Susan]
~pet_name = "Susan"
-> cave_mouth
* [Scout]
~pet_name = "Scout"
-> cave_mouth

== cave_mouth ==
You are at the entrance to a cave. 
{not torch_pickup:There is a torch on the floor.}  
The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now !


+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark. You can't see anything.

{torches > 0} * [Light the torch] -> east_tunnel_lit
+ [Go back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. 
{pet_name == "Spot": Scout would love it here in the west|}
+ [Go back] -> cave_mouth
-> END

== torch_pickup ==
~torches = torches + 1
You now have a torch. May it light the way.
* [Go back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off thousands of coins in the room.
-> END

== hidden_room==
You come up on a hidden room behind a rock wall. Its quiet. You see a glowing orb in the distance.
+ [investigate the orb] -> glowing_orb
+ [leave it alone and return] -> cave_mouth

==glowing_orb==
You brush away the rocks covering up the orb. A sudden breeze puts out your torch!
You pick up the orb . It is now your onky source of light. But you are down a torch.
~ torches = torches - 1
~ has_orb = true 
*[Go Back] -> cave_mouth
-> END

== underground_water ==
Through the tunnel you see a glimmering in the distance. Its a body of water reflecting the orb in your hand. An old paddle boat is tight to a rock on the edge of the water.
+[Use paddle boat to cross the lake] -> lake_crossing
+[Dismiss it and go back] -> cave_mouth
*[Go Back] -> cave_mouth

== lake_crossing ==
You untie the boat and put it into the water and being paddling.Suddenly something hits the bottom of the boat and you fall out. 
~ health = health - 1 
You manage to reach the other side, hurt , but still living. Your health is now {health} -> cave_mouth
*[Go Back] -> cave_mouth
-> END
