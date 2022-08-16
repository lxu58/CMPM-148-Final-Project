INCLUDE locations.ink
INCLUDE combat.ink
INCLUDE storylets.ink

VAR currentTime = 8
LIST timeOfDay = (day), night

//player status variables here?
VAR PLAYER_HEALTH_MAX = 10
VAR playerHealth = 10

//inventory variables here
VAR playerAmmo = 0

//inventory variables here?

->intro

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