INCLUDE locations.ink
INCLUDE combat.ink
INCLUDE storylets.ink
INCLUDE playerInventory.ink
INCLUDE community.ink
INCLUDE intro.ink
INCLUDE date_and_time.ink
INCLUDE defensive.ink

VAR UI = false

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

//player status variables here?
VAR PLAYER_HEALTH_MAX = 10
VAR playerHealth = 10

->title

== title
pee pee poo poo this is the title
* [start the game.]
//    -> intro
    ->day_loop
->END

== day_loop
~ checkTime()
//{time_currentTime}
-> ui_display ->

<-storylets(->day_loop) //display choices for active storylets, pass divert param to return to loop
~ describeCurrentLocation()
<-travel_actions(->day_loop) //display navigation actions
->DONE

== ui_display
{UI:
    ~ temp current_day = start_day + time_daysGone
    Date: {start_month}/{current_day}/{start_year}
    Time: {time_currentTime}:00
    Essentials: {scoreboard_essentials}
    Ammo: {scoreboard_ammo}
}
->->

== reset_route
//nothing yet
->END