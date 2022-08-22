INCLUDE locations.ink
INCLUDE combat.ink
INCLUDE storylets.ink
INCLUDE playerInventory.ink
INCLUDE community.ink
INCLUDE intro.ink
INCLUDE date_and_time.ink
INCLUDE defensive.ink

VAR UI = true

VAR scoreboard_zombiesEncountered = 0
VAR scoreboard_zombiesKilled = 0
    VAR zombie_single = 1
    VAR zombie_group = 10
    VAR zombie_wave = 30

VAR scoreboard_NPCsEncountered = 0

//player status variables here?
VAR PLAYER_HEALTH_MAX = 10
VAR playerHealth = 10

->title

== title
The Last Hope
* [Begin Game]
    -> intro
    //->day_loop
->END

== day_loop
//~ checkTime()
//{time_currentTime}
-> ui_display -> //only displays in loops anyway
//{currentLocation}
~ describeCurrentLocation()

<-storylets(->day_loop) //display choices for active storylets, pass divert param to return to loop
<-travel_actions(->day_loop) //display navigation actions
~travelBlocked = false //unblock travel after 1 loop
->DONE

== ui_display
{UI:
    ~ temp current_day = start_day + time_daysGone
    Date: {start_month}/{current_day}/{start_year}
    Time: {time_currentTime}:00
    //Essentials: {scoreboard_essentials}
    Ammo: {scoreboard_ammo}
}
->->

== reset_route
//nothing yet
->END