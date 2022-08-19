== defensive_1
next day
* [Get close and listen.]
    you quickly saw
    ** [Leave. That's none of your business.]
        once you finish breakfast
        ***["Time for some honey!"] //????
            ->defensive_1_night
    ** [Go listen to what they're saying.]
        ->END
        
== defensive_1_night
night time,
*[Time to leave.]
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