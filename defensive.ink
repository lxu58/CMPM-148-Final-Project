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
{ time_daysGone > 0 || time_daysGone == 0 && StoryletPropTest(defensiveNight1StoryletProps, defensive_night_1, defensiveNight1StoryletStart, defensiveNight1StoryletEnd, defensiveNight1StoryletCooldown, defensiveNight1StoryletTimeSincePlayed, true):
    ~storylets_enabled = false //disable other storylets (below)
	+ [Return to M.]
		-> defensive_night_1 ->
		~ waitStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== defensive_night_1
~ UI = false
night time,
*[Time to leave.]
    ->passTime(2)-> //how long should this storylet take?
    ->->

    "Morning!"
**[...and listen to what he says next.]
    M waits
***[Go ahead and say hello.]
    "Yo, was the solo adventure fun yesterday?"
****[Say goodbye to them and prepare to explore with M.]
    Just like yesterday,
    M sighs deeply, preparing to speak.
*****[Listen to M's reply.]
    Finally, M says "Don't let it become too late to know your friend."
******[Sleep and prepare for tomorrow's exploration.]
    You wait for William
*******[Look around.]
    You look around
********["I see. Let's wait for their news."]
    Morning, you heard some noises.
*********[Ask what happened.]
    Before you can ask, Gray starts speaking
**********["Leave it to me."]
    It's clear you know nothing
    ***********[Run away from the base.]
        Sadly you choose
        ->END
    ***********[Explore for materials.]
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