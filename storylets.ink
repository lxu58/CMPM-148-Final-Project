//this file contains storylets and the code for them

//below are possible storylet properties
LIST replayableProps = repeatable, oneShot

//this knot tests to see if a storylet should be available
//it is called from a storylet descrioption

== function StoryletPropTest(propList, storylet_body_count, storylet_start, storylet_end, storylet_cooldown, time_since_played)
//get all the variables upfront
~ temp never_visited = not storylet_body_count //body has never been visited
~ temp replayable = propList ? repeatable
~ temp cooldown_passed = time_since_played >= storylet_cooldown

~ temp correct_location = propList ? currentLocation
~ temp correct_time_of_day = storylet_start <= currentTime && currentTime <= storylet_end //it is within the hours the storylet is playable

~ temp playable = never_visited || replayable

~ return playable && cooldown_passed && correct_location && correct_time_of_day

//put threads to storylet descriptions here
== storylets(->ret)
<- rest_storylet_description(ret)
<- scavenge_storylet_description(ret)
->DONE

== storyletsPassTime
-> rest_storylet_time ->
-> scavenge_storylet_time ->
->->

// ---------- STORYLETS ----------
//storylets and their descriptions go here

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR restStoryletProps = (repeatable, home)
VAR restStoryletStart = 0
VAR restStoryletEnd = 24
VAR restStoryletCooldown = 0
VAR restStoryletTimeSincePlayed = 25

== rest_storylet_time
~ restStoryletTimeSincePlayed += 1
->->

== rest_storylet_description(->ret)
{ StoryletPropTest(restStoryletProps, rest_storylet_body, restStoryletStart, restStoryletEnd, restStoryletCooldown, restStoryletTimeSincePlayed):
	+ [Rest.]
		-> rest_storylet_body ->
		~ restStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== rest_storylet_body
You lie down and get some rest.
~ temp amountHealed = PLAYER_HEALTH_MAX - playerHealth
You heal {amountHealed} health, and {amountHealed} hours have passed.
~ playerHealth += amountHealed
~ currentTime += amountHealed
- ->->

//scavenging option
VAR scavengeStoryletProps = (repeatable, location1, location2)
VAR scavengeStoryletStart = 8
VAR scavengeStoryletEnd = 20
VAR scavengeStoryletCooldown = 0
VAR scavengeStoryletTimeSincePlayed = 24

== scavenge_storylet_time
~ scavengeStoryletTimeSincePlayed += 1
->->

== scavenge_storylet_description(->ret)
{ StoryletPropTest(scavengeStoryletProps, scavenge_storylet_body, scavengeStoryletStart, scavengeStoryletEnd, scavengeStoryletCooldown, scavengeStoryletTimeSincePlayed):
	+ [Scavenge for supplies.]
		-> scavenge_storylet_body ->
		~ scavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== scavenge_storylet_body
You comb the area for supplies...
    { shuffle:
    	- 	but find nothing.
    	- 	and find some ammo. (Ammo +2)
    	    ~ playerAmmo +=2
    	- 	but you are attacked by a zombie!
    	    //-> damagePlayer(1) ->
    	    -> combat("zombie", 5, 1, ->day_loop)
    }

~ currentTime += 1
- ->->
