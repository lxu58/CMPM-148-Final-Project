VAR time_currentTime = 7 //change this with passTime(hours)
    VAR time_actionCost_1hour = 1
    VAR time_actionCost_2hour = 2
    VAR time_actionCost_6hour = 6
VAR time_daysGone = 0
LIST timeOfDay = (day), night

//not handling time passage checks, july lasts forever
VAR start_month = 7
VAR start_day = 2
VAR start_year = 2030

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

== passTime(hours)
{hours > 0:
~ temp totalHours = time_currentTime + hours
~ temp numDays = FLOOR(totalHours / 24)
~ temp numHours = totalHours % 24

~ time_daysGone += numDays
~ time_currentTime = numHours

-> storyletsPassTime(hours) ->

//this will happen after any travel, including the 4 main locations
//still, i think it's better than putting encounter chance in every storylet
-> chance_encounter(10, ->passTime.passTimeEnd)
}
= passTimeEnd
->->