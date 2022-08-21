VAR flag_W_Route = false
VAR flag_Gray_Route = false

== defensive_intro
//default start for defensive, lower than this will result in death
~scoreboard_essentials = 20
~scoreboard_ammo = 10
UI = true

next day
* [Get close and listen.]
    you quickly saw
    ** [Leave. That's none of your business.]
        once you finish breakfast
        ~flag_W_Route = true
        ***["Time for some honey!"] //????
            ~UI = true
            ->day_loop
    ** [Go listen to what they're saying.]
        ~flag_Gray_Route = true
        ~ UI = false
        ->END


// ---------- STORYLETS ----------
//storylets and their descriptions go here

VAR defensiveNight1StoryletProps = (anywhere)
VAR defensiveNight1StoryletStart = 23
VAR defensiveNight1StoryletEnd = 24
VAR defensiveNight1StoryletCooldown = 0
VAR defensiveNight1StoryletTimeSincePlayed = 25
//also need to check what day it is/what story part

//== defensive_night_1_time(hours)
//~ defensiveNight1StoryletTimeSincePlayed += hours
//->->

//check custom variables FIRST
== defensive_night_1_description(->ret)
{ (!defensive_night_1 && time_daysGone > 0) || (time_daysGone == 0 && StoryletPropTest(defensiveNight1StoryletProps, defensive_night_1, defensiveNight1StoryletStart, defensiveNight1StoryletEnd, defensiveNight1StoryletCooldown, defensiveNight1StoryletTimeSincePlayed, true)):

    ~storylets_enabled = false //disable other storylets (below)
    ~travelBlocked = true
	+ [Return to M.]
		-> defensive_night_1 ->
	-> ret
}
-> DONE

== defensive_night_1
//~ UI = false //no reason for this, UI only displays in loop
//variable reset
~time_daysGone = 0
~time_currentTime = 23
//setting date and time like this does not set cooldowns properly
~scoreboard_essentials = 20
~scoreboard_ammo = 10

~currentLocation = home

night time,
*[Time to leave.]
    ->passTime(2)-> //how long should this storylet take?
    ~zombies_enabled = false
    ->->

VAR defensiveDay2StoryletProps = (anywhere)
VAR defensiveDay2StoryletStart = 7
VAR defensiveDay2StoryletEnd = 24
VAR defensiveDay2StoryletCooldown = 0
VAR defensiveDay2StoryletTimeSincePlayed = 25
//also need to check what day it is/what story part

//check custom variables FIRST
== defensive_day_2_description(->ret)
{ (defensive_night_1 && !defensive_day_2 && time_daysGone > 1) || (time_daysGone == 1 && StoryletPropTest(defensiveDay2StoryletProps, defensive_day_2, defensiveDay2StoryletStart, defensiveDay2StoryletEnd, defensiveDay2StoryletCooldown, defensiveDay2StoryletTimeSincePlayed, true)):

    ~storylets_enabled = false //disable other storylets (below)
    ~travelBlocked = true
	+ [Head back and get some sleep.]
		-> defensive_day_2 ->
	-> ret
}
-> DONE

== defensive_day_2
//variable Residential
~time_daysGone = 1 //should this be later??
~time_currentTime = 7
~scoreboard_essentials = 20
~scoreboard_ammo = 10

~currentLocation = home

"Morning!"
*[...and listen to what he might say.]
    M waits
**[Go ahead and say hello.]
    "Yo, was the solo adventure fun yesterday?"
***[Say goodbye to them and prepare to explore with M.]
    ~zombies_enabled = true
    ->->


VAR defensiveNight2StoryletProps = (anywhere)
VAR defensiveNight2StoryletStart = 23
VAR defensiveNight2StoryletEnd = 24
VAR defensiveNight2StoryletCooldown = 0
VAR defensiveNight2StoryletTimeSincePlayed = 25
//also need to check what day it is/what story part

//check custom variables FIRST
== defensive_night_2_description(->ret)
{ (defensive_day_2 && !defensive_night_2 && time_daysGone > 1) || (time_daysGone == 1 && StoryletPropTest(defensiveNight2StoryletProps, defensive_night_2, defensiveNight2StoryletStart, defensiveNight2StoryletEnd, defensiveNight2StoryletCooldown, defensiveNight2StoryletTimeSincePlayed, true)):

    ~storylets_enabled = false //disable other storylets (below)
    ~travelBlocked = true
	+ [Go back to base with M.]
		-> defensive_night_2 ->
	-> ret
}
-> DONE

== defensive_night_2
~time_daysGone = 1
~time_currentTime = 23
~scoreboard_essentials = 20
~scoreboard_ammo = 10

~currentLocation = home

Just like yesterday,
*[Listen to M's reply.]
    Finally, M says "Don't let it become too late to know your friend."
**[Sleep and prepare for tomorrow's exploration.]
    ->->


VAR defensiveNight3StoryletProps = (anywhere)
VAR defensiveNight3StoryletStart = 23
VAR defensiveNight3StoryletEnd = 24
VAR defensiveNight3StoryletCooldown = 0
VAR defensiveNight3StoryletTimeSincePlayed = 25
//also need to check what day it is/what story part

//check custom variables FIRST
== defensive_night_3_description(->ret)
{ (defensive_night_2 && !defensive_night_3 && time_daysGone > 2) || (time_daysGone == 2 && StoryletPropTest(defensiveNight3StoryletProps, defensive_night_3, defensiveNight3StoryletStart, defensiveNight3StoryletEnd, defensiveNight3StoryletCooldown, defensiveNight3StoryletTimeSincePlayed, true)):

    ~storylets_enabled = false //disable other storylets (below)
    ~travelBlocked = true
	+ [Go back to the base with your materials.]
		-> defensive_night_3 ->
	-> ret
}
-> DONE

== defensive_night_3
~time_daysGone = 2
~time_currentTime = 23
~scoreboard_essentials = 20
~scoreboard_ammo = 10

~currentLocation = home
    You wait for William
*[Look around.]
    You look around
**["I see. Let's wait for their news."]
    Morning, you heard some noises.
***[Ask what happened.]
    Before you can ask, Gray starts speaking
****["Leave it to me."]
    ->->


VAR defensiveDay4StoryletProps = (anywhere)
VAR defensiveDay4StoryletStart = 7
VAR defensiveDay4StoryletEnd = 24
VAR defensiveDay4StoryletCooldown = 0
VAR defensiveDay4StoryletTimeSincePlayed = 25
//also need to check what day it is/what story part

//check custom variables FIRST
== defensive_day_4_description(->ret)
{ (defensive_night_3 && !defensive_day_4 && time_daysGone > 3) || (time_daysGone == 3 && StoryletPropTest(defensiveDay4StoryletProps, defensive_day_4, defensiveDay4StoryletStart, defensiveDay4StoryletEnd, defensiveDay4StoryletCooldown, defensiveDay4StoryletTimeSincePlayed, true)):

    ~storylets_enabled = false //disable other storylets (below)
    ~travelBlocked = true
	+ [It's the day of the final battle...]
		-> defensive_day_4 ->
	-> ret
}
-> DONE

== defensive_day_4
~time_daysGone = 3
~time_currentTime = 7
~scoreboard_essentials = 20
~scoreboard_ammo = 10

It's clear you know nothing
*[Run away from the base.]
    Sadly you choose
    ->END
*[Explore for materials.]
    {scoreboard_community_score < 50:
    -> END
    - else:
    ->defensive_1_got_enough_equipment
    }

== defensive_1_got_enough_equipment
"Seems like we got enough
*[You notice there is something on the table.]
    It's an old teddy bear.
**[Wait until zombies attack.]
    "pew"
***[Go to the frontline.]
    Once you arrive,
****[You turn your head toward William.]
    "Is everyone from behind okay?" He asks.
*****[Start running away.]
    You start to run away
    Normal End
    ->END