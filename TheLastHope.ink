INCLUDE locations.ink
INCLUDE combat.ink
INCLUDE storylets.ink
INCLUDE playerInventory.ink
INCLUDE community.ink
INCLUDE intro.ink



VAR scoreboard_zombiesEncountered = 0
VAR scoreboard_zombiesKilled = 0
    VAR zombie_single = 1
    VAR zombie_group = 10
    VAR zombie_wave = 30

VAR scoreboard_NPCsEncountered = 0
    
VAR scoreboard_essentials = 50
    VAR essentials_get_few = 5
    VAR essentials_get_fine = 10
    VAR essentials_get_alot = 40
    VAR essentials_cost_daily = -10
    VAR essentials_cost_action = -5
    VAR essentials_cost_mission = -50

VAR time_currentTime = 7 //change this with passTime(hours)
    VAR time_actionCost_1hour = 1
    VAR time_actionCost_2hour = 2
    VAR time_actionCost_6hour = 6
VAR time_daysGone = 0
LIST timeOfDay = (day), night

//player status variables here?
VAR PLAYER_HEALTH_MAX = 10
VAR playerHealth = 10

->title

//checks the current time and decides if it is day or night
//if time is greater than 24, sets it back to 0
== function checkTime()
//{currentTime > 24:
//~ currentTime -= 2
//}
The time is currently {time_currentTime}:00. <>
{time_currentTime >= 7 && time_currentTime < 23:
It is daytime.
~ timeOfDay = day
}
{time_currentTime < 7 || time_currentTime >= 23:
It is night time.
~ timeOfDay = night
}

=== passTime(hours)
{hours > 0:
~ temp totalHours = time_currentTime + hours
~ temp numDays = FLOOR(totalHours / 24)
~ temp numHours = totalHours % 24

~ time_daysGone += numDays
~ time_currentTime = numHours

-> storyletsPassTime(hours) ->
}
->->

== title
pee pee poo poo this is the title
* [start the game.]
    -> intro
->END

== day_loop
~ checkTime()

<-storylets(->day_loop) //display choices for active storylets, pass divert param to return to loop
~ describeCurrentLocation()
<-travel_actions(->day_loop) //display navigation actions
->DONE