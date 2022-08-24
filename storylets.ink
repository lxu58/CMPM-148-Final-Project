//this file contains storylets and the code for them
VAR storylets_enabled = true

//below are possible storylet properties
LIST replayableProps = repeatable, oneShot
LIST metaLocationProps = anywhere
//storylets disabling other storylets occurs INSIDE description

//this knot tests to see if a storylet should be available
//it is called from a storylet descrioption

== function StoryletPropTest(propList, storylet_body_count, storylet_start, storylet_end, storylet_cooldown, time_since_played, other_condition)
//get all the variables upfront
~ temp never_visited = not storylet_body_count //body has never been visited
~ temp replayable = propList ? repeatable
~ temp cooldown_passed = time_since_played >= storylet_cooldown

~ temp correct_location = propList ? currentLocation || propList ? anywhere
~ temp correct_time_of_day = storylet_start <= time_currentTime && time_currentTime <= storylet_end //it is within the hours the storylet is playable

~ temp playable = never_visited || replayable

//see if this story should be available
~return playable && cooldown_passed && correct_location && correct_time_of_day && other_condition && storylets_enabled



//put threads to storylet descriptions here
== storylets(->ret)
//storylets that can disable other storylets MUST go above the ones they disable
<- defensive_night_1_description(ret)
<- defensive_day_2_description(ret)
<- defensive_night_2_description(ret)
<- defensive_night_3_description(ret)

<- wait_storylet_description(ret)
<- rest_storylet_description(ret)
<- status_storylet_description(ret)
<- first_aid_storylet_description(ret)
//<- scavenge_storylet_description(ret)
<- military_scavenge_storylet_description(ret)
<- military_underground_scavenge_storylet_description(ret)
<- train_station_scavenge_storylet_description(ret)
<- residential_scavenge_storylet_description(ret)
<- mall_scavenge_storylet_description(ret)

//<- simple_chance_storylet_description(ret)
~ storylets_enabled = true //re-enable storylets
->DONE

== storyletsPassTime(hours)
-> wait_storylet_time(hours) ->
-> rest_storylet_time(hours) ->
-> status_storylet_time(hours) ->
-> first_aid_storylet_time(hours) ->
//-> simple_chance_storylet_time(hours) ->
//-> scavenge_storylet_time(hours) ->
-> military_scavenge_storylet_time(hours) ->
-> military_underground_scavenge_storylet_time(hours) ->
-> train_station_scavenge_storylet_time(hours) ->
-> residential_scavenge_storylet_time(hours) ->
-> residential_scavenge_storylet_time(hours) ->
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
	+ [Wait an hour.]
		-> wait_storylet_body ->
		~ waitStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== wait_storylet_body
You wait an hour. //waiting too long messes with stuff a little
~ temp timeToWait = 1
/*
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
    */
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
	+ [Rest and heal.]
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
+[Check inventory.]
    -> displayInventory ->
+[Check how many days have passed.]
    Days Passed: {time_daysGone}
+[Check how many zombies you have fought.]
    Zombies Encountered: {scoreboard_zombiesEncountered}
    Zombies Killed: {scoreboard_zombiesKilled}
- ->->

//use a first aid kit
VAR firstAidStoryletProps = (repeatable, anywhere)
VAR firstAidStoryletStart = 0
VAR firstAidStoryletEnd = 24
VAR firstAidStoryletCooldown = 0
VAR firstAidStoryletTimeSincePlayed = 25

== first_aid_storylet_time(hours)
~ statusStoryletTimeSincePlayed += hours
->->

== first_aid_storylet_description(->ret)
{ playerHealth < 10 && firstAidKits > 0 && StoryletPropTest(firstAidStoryletProps, first_aid_storylet_body, firstAidStoryletStart, firstAidStoryletEnd, firstAidStoryletCooldown, firstAidStoryletTimeSincePlayed, true):
	+ [Use a first-aid kit.]
		-> first_aid_storylet_body ->
		~ firstAidStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== first_aid_storylet_body
You sit down and begin applying the first-aid kit.
~ temp max_health_gain = PLAYER_HEALTH_MAX - playerHealth
~ temp health_gain = 0
{ max_health_gain > 3:
    ~ health_gain = 3
- else:
    ~ health_gain = max_health_gain
}
You have healed {health_gain} health.
~ firstAidKits -= 1
~ playerHealth += health_gain

{firstAidKits <= 0: You have no first-aid kits left.}
{firstAidKits == 1: You have 1 first-aid kit left.}
{firstAidKits > 1: You have {firstAidKits} first-aid kit left.}
-> passTime(1) ->
- ->->

//scavenging option
VAR scavengeStoryletProps = (repeatable, warehouse, underground_deep, train_station_inside, 1_story_house, 2_story_house, mall_left_wing, mall_right_wing)
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
    	    ~ scoreboard_ammo +=2
    	- 	but you are attacked by a zombie!
    	    //-> damagePlayer(1) ->
    	    -> combat("zombie", 5, 1, 10, ->day_loop)
    }

-> passTime(1) ->
- ->->

//military base scavenging
VAR militaryScavengeStoryletProps = (repeatable, warehouse)
VAR militaryScavengeStoryletStart = 7
VAR militaryScavengeStoryletEnd = 23
VAR militaryScavengeStoryletCooldown = 0
VAR militaryScavengeStoryletTimeSincePlayed = 24

== military_scavenge_storylet_time(hours)
~ militaryScavengeStoryletTimeSincePlayed += hours
->->

== military_scavenge_storylet_description(->ret)
{ StoryletPropTest(militaryScavengeStoryletProps, military_scavenge_storylet_body, militaryScavengeStoryletStart, militaryScavengeStoryletEnd, militaryScavengeStoryletCooldown, militaryScavengeStoryletTimeSincePlayed, true):
	+ [Look through the containers.]
		-> military_scavenge_storylet_body ->
		~ militaryScavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== military_scavenge_storylet_body
You carefully search for any remaining items, and find:
~ temp chance_80 = RANDOM(1, 100) <= 80
~ temp chance_50 = RANDOM(1, 100) <= 50
~ temp chance_20 = RANDOM(1, 100) <= 20
{chance_80:
    {shuffle:
        - 5 Ammo
            ~ scoreboard_ammo += 5
        - 1 Bolt-Action Rifle
            ~ boltActionRifles += 1
        - 1 Handgun
            ~handguns += 1
    }
}
{chance_50:
    {shuffle:
        - 3 Military MREs
            ~ militaryMREs += 3
        - 2 AR-15s
            ~ AR15s += 1
        - 10 Ammo
            ~ scoreboard_ammo += 10
    }
}
{chance_20:
    {shuffle:
        - 20 Ammo
            ~ scoreboard_ammo += 20
        - 4 AR-15s
            ~ AR15s += 4
        - 5 Military MREs
            ~ militaryMREs += 5
        - 1 Bulletproof Vest
            ~ bulletproofVests += 1
    }
}
{(chance_20 or chance_50 or chance_80) == false:
    Nothing
}
-> passTime(1) ->
- ->->

//military base underground scavenging
VAR militaryUndergroundScavengeStoryletProps = (repeatable, underground_deep)
VAR militaryUndergroundScavengeStoryletStart = 7
VAR militaryUndergroundScavengeStoryletEnd = 23
VAR militaryUndergroundScavengeStoryletCooldown = 0
VAR militaryUndergroundScavengeStoryletTimeSincePlayed = 24

== military_underground_scavenge_storylet_time(hours)
~ militaryUndergroundScavengeStoryletTimeSincePlayed += hours
->->

== military_underground_scavenge_storylet_description(->ret)
{ StoryletPropTest(militaryUndergroundScavengeStoryletProps, military_underground_scavenge_storylet_body, militaryUndergroundScavengeStoryletStart, militaryUndergroundScavengeStoryletEnd, militaryUndergroundScavengeStoryletCooldown, militaryUndergroundScavengeStoryletTimeSincePlayed, true):
	+ [Search the boxes.]
		-> military_underground_scavenge_storylet_body ->
		~ militaryUndergroundScavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== military_underground_scavenge_storylet_body
You find:
~ temp chance_90 = RANDOM(1, 100) <= 90
~ temp chance_60 = RANDOM(1, 100) <= 60
~ temp chance_30 = RANDOM(1, 100) <= 30
{chance_90:
    {shuffle:
        - 5 Ammo
            ~ scoreboard_ammo += 5
        - 1 Bolt-Action Rifle
            ~ boltActionRifles += 1
        - 1 Handgun
            ~handguns += 1
    }
}
{chance_60:
    {shuffle:
        - 3 Military MREs
            ~ militaryMREs += 3
        - 2 AR-15s
            ~ AR15s += 1
        - 10 Ammo
            ~ scoreboard_ammo += 10
    }
}
{chance_30:
    {shuffle:
        - 20 Ammo
            ~ scoreboard_ammo += 20
        - 4 AR-15s
            ~ AR15s += 4
        - 5 Military MREs
            ~ militaryMREs += 5
        - 1 Bulletproof Vest
            ~ bulletproofVests += 1
    }
}
{(chance_30 or chance_60 or chance_90) == false:
    Nothing
}
-> passTime(1) ->
- ->->


//train station scavenging
VAR trainStationScavengeStoryletProps = (repeatable, train_station_inside)
VAR trainStationScavengeStoryletStart = 7
VAR trainStationScavengeStoryletEnd = 23
VAR trainStationScavengeStoryletCooldown = 0
VAR trainStationScavengeStoryletTimeSincePlayed = 24

== train_station_scavenge_storylet_time(hours)
~ trainStationScavengeStoryletTimeSincePlayed += hours
->->

== train_station_scavenge_storylet_description(->ret)
{ StoryletPropTest(trainStationScavengeStoryletProps, train_station_scavenge_storylet_body, trainStationScavengeStoryletStart, trainStationScavengeStoryletEnd, trainStationScavengeStoryletCooldown, trainStationScavengeStoryletTimeSincePlayed, true):
	+ [Look for loot in the train station.]
		-> train_station_scavenge_storylet_body ->
		~ trainStationScavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== train_station_scavenge_storylet_body
You carefully search for any remaining items, and find:
~ temp chance_80 = RANDOM(1, 100) <= 80
~ temp chance_50 = RANDOM(1, 100) <= 50
~ temp chance_20 = RANDOM(1, 100) <= 20
{chance_80:
    {shuffle:
        - 1 Single-Liter Water Bottle
            ~ bottlesOfWater += 1
        - 1 Bag of Packed Food
            ~ bagsOfFood += 1
        - 1 Riot Shield
            ~ riotShields += 1
    }
}
{chance_50:
    {shuffle:
        - 1 Broken Steel Gate
            ~ brokenSteelGates += 1
        - 5 Ammo
            ~ scoreboard_ammo += 5
        - 2 Riot Shields
            ~ riotShields += 2
        - 1 Handgun
            ~ handguns += 1
    }
}
{chance_20:
    {shuffle:
        - 5 Single-Liter Water Bottles
            ~ bottlesOfWater += 5
        - 5 Bags of Packed Food
            ~ bagsOfFood += 5
        - 3 Broken Steel Gates
            ~ brokenSteelGates += 3
    }
}
{(chance_20 or chance_50 or chance_80) == false:
    Nothing
}
-> passTime(1) ->
- ->->

//residential district scavenging
VAR residentialScavengeStoryletProps = (repeatable, 1_story_house, 2_story_house)
VAR residentialScavengeStoryletStart = 7
VAR residentialScavengeStoryletEnd = 23
VAR residentialScavengeStoryletCooldown = 0
VAR residentialScavengeStoryletTimeSincePlayed = 24

== residential_scavenge_storylet_time(hours)
~ residentialScavengeStoryletTimeSincePlayed += hours
->->

== residential_scavenge_storylet_description(->ret)
{ StoryletPropTest(residentialScavengeStoryletProps, residential_scavenge_storylet_body, residentialScavengeStoryletStart, residentialScavengeStoryletEnd, residentialScavengeStoryletCooldown, residentialScavengeStoryletTimeSincePlayed, true):
	+ [Comb the house for supplies.]
		-> residential_scavenge_storylet_body ->
		~ residentialScavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== residential_scavenge_storylet_body
You carefully search for any remaining items, and find:
~ temp chance_80 = RANDOM(1, 100) <= 80
~ temp chance_50 = RANDOM(1, 100) <= 50
~ temp chance_20 = RANDOM(1, 100) <= 20
{chance_80:
    {shuffle:
        - 1 Single-Liter Water Bottle
            ~ bottlesOfWater += 1
        - 1 Bag of Packed Food
            ~ bagsOfFood += 1
        - 1 First-Aid Kit
            ~ firstAidKits += 1
        - 1 Frying Pan
            ~ fryingPans += 1
    }
}
{chance_50:
    {shuffle:
        - 5 Ammo
            ~ scoreboard_ammo += 5
        - 1 Handgun
            ~ handguns += 1
        - 3 Single-Liter Water Bottles
            ~ bottlesOfWater += 3
        - 3 Bags of Packed Food
            ~ bagsOfFood += 1
        - 1 First-Aid Kit
            ~ firstAidKits += 1
    }
}
{chance_20:
    {shuffle:
        - 5 Single-Liter Water Bottles
            ~ bottlesOfWater += 5
        - 5 Bags of Packed Food
            ~ bagsOfFood += 5
        - 2 Bolt-Action Rifles
            ~ boltActionRifles += 2
        - 10 Ammo
            ~ scoreboard_ammo += 10
    }
}
{(chance_20 or chance_50 or chance_80) == false:
    Nothing
}
-> passTime(1) ->
- ->->

//shopping mall scavenging
VAR mallScavengeStoryletProps = (repeatable, mall_left_wing, mall_right_wing)
VAR mallScavengeStoryletStart = 7
VAR mallScavengeStoryletEnd = 23
VAR mallScavengeStoryletCooldown = 0
VAR mallScavengeStoryletTimeSincePlayed = 24

== mall_scavenge_storylet_time(hours)
~ mallScavengeStoryletTimeSincePlayed += hours
->->

== mall_scavenge_storylet_description(->ret)
{ StoryletPropTest(mallScavengeStoryletProps, mall_scavenge_storylet_body, mallScavengeStoryletStart, mallScavengeStoryletEnd, mallScavengeStoryletCooldown, mallScavengeStoryletTimeSincePlayed, true):
	+ [Look through the stores for anything of use.]
		-> mall_scavenge_storylet_body ->
		~ mallScavengeStoryletTimeSincePlayed = 0
	-> ret
}
-> DONE

== mall_scavenge_storylet_body
You carefully search for any remaining items, and find:
~ temp chance_80 = RANDOM(1, 100) <= 80
~ temp chance_50 = RANDOM(1, 100) <= 50
~ temp chance_20 = RANDOM(1, 100) <= 20
{chance_80:
    {shuffle:
        - 2 Single-Liter Water Bottle
            ~ bottlesOfWater += 2
        - 2 Bags of Packed Food
            ~ bagsOfFood += 2
        - 1 First-Aid Kit
            ~ firstAidKits += 1
        - 1 Emergency Axe
            ~ emergencyAxes += 1
        - 1 Bag of Clothing
            ~ bagsOfClothing += 1
    }
}
{chance_50:
    {shuffle:
        - 5 Single-Liter Water Bottles
            ~ bottlesOfWater += 5
        - 5 Bags of Packed Food
            ~ bagsOfFood += 5
        - 2 First-Aid Kits
            ~ firstAidKits += 2
        - 3 Bags of Clothing
            ~ bagsOfClothing += 3
    }
}
{chance_20:
    {shuffle:
        - 8 Single-Liter Water Bottles
            ~ bottlesOfWater += 8
        - 8 Bags of Packed Food
            ~ bagsOfFood += 8
        - 5 Bags of Clothing
            ~ bagsOfClothing += 5
        - 2 Security Tasers
            ~ securityTasers += 2
        - 3 First-Aid Kits
            ~ firstAidKits += 3
    }
}
{(chance_20 or chance_50 or chance_80) == false:
    Nothing
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