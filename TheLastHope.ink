VAR currentTime = 8
LIST timeOfDay = (day), night

LIST allLocations = home, location1, location2
VAR currentLocation = home

//here we list where is connected to where, it's basically the map
VAR connectedToHome = (location1, location2)
VAR connectedToLocation1 = (home, location2)
VAR connectedToLocation2 = (home)

//player status variables here?
VAR playerHealth = 10
VAR travelBlocked = false //might be useful

//inventory variables here?

->intro

== damagePlayer(health_to_lose)
~ playerHealth -= health_to_lose
{playerHealth <= 0: ->dead}
->->

== dead
You are dead!
->END

//test if locations are connected to other locations here
== function canTravel(location)
{travelBlocked: 
    ~return false
}
{ currentLocation:
    -home:
        ~ return connectedToHome ? location
    -location1:
        ~ return connectedToLocation1 ? location
    -location2:
        ~ return connectedToLocation2 ? location
}

//adds an hour onto the time and changes the location
== function travel(location)
~ currentTime += 1
~ currentLocation = location

// here you can put a description on the current location
== function describeCurrentLocation()
{ currentLocation:
	- home:
		This is a description of home.
	- location1:
		This is a description of location 1.
	- location2:
		This is a description of location 2.
}

//checks the current time and decides if it is day or night
//if time is greater than 24, sets it back to 0
== function checkTime()
{currentTime > 24:
~ currentTime -= 24
}
The time is currently {currentTime}:00.
{currentTime >= 8 && currentTime < 20:
It is daytime.
~ timeOfDay = day
}
{currentTime < 8 || currentTime >= 20:
It is night time.
~ timeOfDay = night
}

== intro
pee pee poo poo this is the intro
* [start the game.]
    -> day_loop
->END

== day_loop
Health: {playerHealth}

-> storyletsPassTime ->

//check the time
~ checkTime()

<-storylets(->day_loop) //display choices for active storylets, pass divert param to return to loop
~ describeCurrentLocation()
<-travel_actions(->day_loop) //display navigation actions
->DONE

== travel_actions(->ret)
+ {canTravel(home)} [Go home.]
	you go home
	~ travel(home)
+ {canTravel(location1)} [Go to location1.]
	you go to location 1
	~ travel(location1)
+ {canTravel(location2)} [Go to location2.]
	you go to location 2
    ~ travel(location2)
- ->ret

// ---------- STORYLETS ----------
//below are possible storylet properties
LIST replayableProps = repeatable, oneShot


//this knot tests to see if a storylet should be available
//it is called from a storylet descrioption

== function StoryletPropTest(propList, storylet_body_count, storylet_start, storylet_end, storylet_cooldown, time_since_played)
//get all the variables upfront
~ temp never_visited = not storylet_body_count //body has never been visited
~ temp replayable = propList ? repeatable
~ temp cooldown_passed = time_since_played > storylet_cooldown

~ temp correct_location = propList ? currentLocation
~ temp correct_time_of_day = storylet_start <= currentTime && currentTime <= storylet_end //it is within the hours the storylet is playable

~ temp playable = never_visited || replayable

~ return playable && cooldown_passed && correct_location && correct_time_of_day

//put threads to storylet descriptions here
== storylets(->ret)
<- generic_storylet_description(ret)
<- scavenge_storylet_description(ret)
->DONE

== storyletsPassTime
-> generic_storylet_time ->
-> scavenge_storylet_time ->
->->

//storylets and their descriptions go here

//props, and range of time it is available, time until it can be repeated, time storylet was last played
VAR genericStoryletProps = (repeatable, home)
VAR genericStoryletStart = 6
VAR genericStoryletEnd = 16
VAR genericStoryletCooldown = 6
VAR genericStoryletTimeSincePlayed = 24

== generic_storylet_time
~ genericStoryletTimeSincePlayed += 1
->->

== generic_storylet_description(->ret)
{ StoryletPropTest(genericStoryletProps, generic_storylet_body, genericStoryletStart, genericStoryletEnd, genericStoryletCooldown, genericStoryletTimeSincePlayed):
	+ [do the generic storylet.]
		-> generic_storylet_body ->
		~ genericStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== generic_storylet_body
generic storylet text, also it's 2 hours later now
~ currentTime += 2
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
    	- 	and find some hidden away, but since you don't have an inventory yet, you can't take it home. :(
    	- 	but you are attacked! Roll for initiative. (Just kidding, no combat yet.)
    	    -> damagePlayer(1) ->
    }

~ currentTime += 1
- ->->
