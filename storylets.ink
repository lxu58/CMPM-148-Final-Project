//this file contains storylets and the code for them

//below are possible storylet properties
LIST replayableProps = repeatable, oneShot
LIST metaLocationProps = anywhere

//this knot tests to see if a storylet should be available
//it is called from a storylet descrioption

== function StoryletPropTest(propList, storylet_body_count, storylet_start, storylet_end, storylet_cooldown, time_since_played, hourly_enabled)
//get all the variables upfront
~ temp never_visited = not storylet_body_count //body has never been visited
~ temp replayable = propList ? repeatable
~ temp cooldown_passed = time_since_played >= storylet_cooldown

~ temp correct_location = propList ? currentLocation || propList ? anywhere
~ temp correct_time_of_day = storylet_start <= time_currentTime && time_currentTime <= storylet_end //it is within the hours the storylet is playable

~ temp playable = never_visited || replayable

~ return playable && cooldown_passed && correct_location && correct_time_of_day && hourly_enabled

//put threads to storylet descriptions here
== storylets(->ret)
<- wait_storylet_description(ret)
<- rest_storylet_description(ret)
<- status_storylet_description(ret)
<- scavenge_storylet_description(ret)
<- simple_chance_storylet_description(ret)
->DONE

== storyletsPassTime(hours)
-> wait_storylet_time(hours) ->
-> rest_storylet_time(hours) ->
-> status_storylet_time(hours) ->
-> simple_chance_storylet_time(hours) ->
-> scavenge_storylet_time(hours) ->
->->

// ---------- STORYLETS ----------
//storylets and their descriptions go here

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR waitStoryletProps = (repeatable, anywhere)
VAR waitStoryletStart = 0
VAR waitStoryletEnd = 24
VAR waitStoryletCooldown = 0
VAR waitStoryletTimeSincePlayed = 25

== wait_storylet_time(hours)
~ waitStoryletTimeSincePlayed += hours
->->

== wait_storylet_description(->ret)
{ StoryletPropTest(waitStoryletProps, wait_storylet_body, waitStoryletStart, waitStoryletEnd, waitStoryletCooldown, waitStoryletTimeSincePlayed, true):
	+ [Wait.]
		-> wait_storylet_body ->
		~ waitStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== wait_storylet_body
How long will you wait?
~ temp timeToWait = 0
+[Nevermind.]
    ->->
+[Wait 1 hour.]
    ~ timeToWait = 1
+[Wait 6 hours.]
    ~ timeToWait = 6
+[Wait 12 hours.]
    ~ timeToWait = 12
+[Wait 24 hours.]
    ~ timeToWait = 24
- -> passTime(timeToWait) ->
->->

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR restStoryletProps = (repeatable, home)
VAR restStoryletStart = 0
VAR restStoryletEnd = 24
VAR restStoryletCooldown = 0
VAR restStoryletTimeSincePlayed = 25

== rest_storylet_time(hours)
~ restStoryletTimeSincePlayed += hours
->->

== rest_storylet_description(->ret)
{ StoryletPropTest(restStoryletProps, rest_storylet_body, restStoryletStart, restStoryletEnd, restStoryletCooldown, restStoryletTimeSincePlayed, true):
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
-> passTime(amountHealed) ->
- ->->

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR statusStoryletProps = (repeatable, anywhere)
VAR statusStoryletStart = 0
VAR statusStoryletEnd = 24
VAR statusStoryletCooldown = 0
VAR statusStoryletTimeSincePlayed = 25

== status_storylet_time(hours)
~ statusStoryletTimeSincePlayed += hours
->->

== status_storylet_description(->ret)
{ StoryletPropTest(statusStoryletProps, status_storylet_body, statusStoryletStart, statusStoryletEnd, statusStoryletCooldown, statusStoryletTimeSincePlayed, true):
	+ [Check your status.]
		-> status_storylet_body ->
		~ statusStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== status_storylet_body
+[Check health.]
    Health: {playerHealth}
+[Check how many days have passed.]
    Days Passed: {time_daysGone}
+[Check inventory.]
    -> displayInventory ->
- ->->

//scavenging option
VAR scavengeStoryletProps = (repeatable, location1, location2)
VAR scavengeStoryletStart = 8
VAR scavengeStoryletEnd = 20
VAR scavengeStoryletCooldown = 0
VAR scavengeStoryletTimeSincePlayed = 24

== scavenge_storylet_time(hours)
~ scavengeStoryletTimeSincePlayed += hours
->->

== scavenge_storylet_description(->ret)
{ StoryletPropTest(scavengeStoryletProps, scavenge_storylet_body, scavengeStoryletStart, scavengeStoryletEnd, scavengeStoryletCooldown, scavengeStoryletTimeSincePlayed, true):
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
    	    ~ scoreboard_Ammo +=2
    	- 	but you are attacked by a zombie!
    	    //-> damagePlayer(1) ->
    	    -> combat("zombie", 5, 1, ->day_loop)
    }

-> passTime(1) ->
- ->->


// MIX-INS, not "true" storylets, not unthreaded

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR simpleChanceStoryletProps = (repeatable, anywhere)
VAR simpleChanceStoryletStart = 0
VAR simpleChanceStoryletEnd = 24
VAR simpleChanceStoryletCooldown = 0
VAR simpleChanceStoryletTimeSincePlayed = 25
VAR simpleChanceStoryletHourlyChance = 25
VAR simpleChanceStoryletHourlyEnabled = true

== simple_chance_storylet_time(hours)
~ simpleChanceStoryletTimeSincePlayed += hours
{RANDOM(1,100) <= simpleChanceStoryletHourlyChance:
    ~simpleChanceStoryletHourlyEnabled = true
- else:
   ~ simpleChanceStoryletHourlyEnabled = false
}
->->

== simple_chance_storylet_description(->ret)
{ StoryletPropTest(simpleChanceStoryletProps, simple_chance_storylet_body, simpleChanceStoryletStart, simpleChanceStoryletEnd, simpleChanceStoryletCooldown, simpleChanceStoryletTimeSincePlayed, simpleChanceStoryletHourlyEnabled):
	* [There is a 25% chance of this showing up.]
		-> simple_chance_storylet_body ->
		~ simpleChanceStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== simple_chance_storylet_body
25% sample text
- ->->
