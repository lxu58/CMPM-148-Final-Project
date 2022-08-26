# CMPM-148-Final-Project

Note: The following content is same as content in TheLastHope.writeup.


-Title - The Last Hope
-Group:  4:  
    Julian Cady
    Kevin Khau
    Laihong Xu
    Pengfei Li


-Story Summary (background and story planned by Laihong, writer)
    Important Note: Don't edit/revise this part

    Roger is a business man who wakes up and gets attacked by zombie. Gray, who is Roger's secretary, helps Roger from zombie's attack, and they start to build their own base and survive from this world. since Roger has lost his memory, the story has three major unreliable narrator: Roger, Gray, and god view. Roger is the man who starts the zombie project, but feel regert at the end. Gray is a spy who is trying to stop Roger because this project caused him to lost both wife and daughter, and finally fight him at the lab and triggered the zombie's bio weapon (this is how world ends). The god view will lead players to see how Roger acts like a buiness man and deal with communities (supposed to have 4 different but end up with 1 because we don't have time). Roger's attitude change and memory flashback is the key of the ending determination. If Roger regains the regret of making this bio weapon and showing his cares about people, then Gray will understand Roger at the end and stop from killing him. If Roger doesn't get the memory back, and trying to use his privilege (Roger won't get infested) at the end world, Gray will shoot him with the bullet left in his pistol. Gray's true job is revealed at the of the intro, and Roger's attitude changed is reflected the ending. 
    In defensive community, Roger will help Mr.J and W, who is the storage manager of this community. W is the key character who is accompanied with Roger in the entire route. W, William, will resonate powerfully with both Gray and Roger. They will help the Mr.J and W, William to fight the groups of zombies attack the base at the end. In good ending, Gray sees the change in Roger, and gives up hunting him and leave the base becasue he still feel regretful by releasing bio weapon, more importantly, he still can't forgive Roger for losing Wife and daughter, but Roger will end up with living with this community. In normal ending, Roger will help the community to move to another base, but he lost contact with Gray, Mr.J, and William, he becomes the leader of the base, and at the end change his attitude toward his view of world, but no one will see this anymore. In bad ending, Roger will leave the base because more and more people got killed by the zombie (people start exploring the area and got killed because of lack of essentials), and Gray will kill Roger because of the leaving. 

    Postscript by Laihong (skip this if you have no interest):
    For detailed story, characters, routes, and world setup you can see 
    https://jamboard.google.com/d/1xsHuawjF7x2fIhaO6PGTuZsM1Sb96ptWH3fNOQWgkgM/viewer?f=0 or the story_graph_1 and 2 files.
    I made a world based on how we plan, but we run out of time because of the lack of the management in first two weeks, the plan of the story is about 50k words long and every route is about 8k, but at the end, we only made one community (one route), and I am trying to make this as much details as possible for player to understand the world I am making. The exploring cycle and events are made by Pengfei, it has some conflict against the setting up, also since we don't have time to do second polishing, the story might have some conflict too. It's totally understandable and also we all did as much as we can within the time we have. Despite of that, it was so fun for me to make a story with the theme of zombie dystopia. I was so panicking making something without adventure and romantic because those are something I usually plan and write (my comfort room), but it's totally worthwhile to think about this story and write them done.




-Experience Goal - describing the player experience goal

    Includes themes of construction, survival, exploring, and relationship building. The goal is to make the player be more rational and stressed by making choices that will impact the end goal as well as making them experience the thrill of surviving zombies’ attacks, and enjoy the different ending through the decision made by themselves.


-Narrative Stance and Rationale - how the story structure/architecture shapes its meaning

    The story majorly talks in a second-person style, but once it enters the final chapter, it may switch to the first person to “Roger” or “Gray to modify the characters’ change. Normally, the focal point is Roger, but it changes base the the story line. The narrator is unreliable (such as memory lost). also the sub ending (normal ending) is used as supplementary events to make players to understand the truth of the story.

    The unreliable narrator (amnesia) pushes players to search for supplementary events to understand the truth. Every ending has important and unique message about the truth, but none of them will reveal the truth itself on that route.

-Story Structure (graphs) - describing the tools Inks provides were used in your game

    The story is made by three different types of structure: 
    1. linear, which is used for main story line. It talks about the main storys and combined with few death ending cycle
    2. recursive structure,  which is used for exploration in our story. Player can manage their action themselves, and randomly trigger events. It will recursively run 10 times everyday
    3. branch, which is used to lead players to different ending. If they go to good ending, they can't head back.

    see details graphs on https://docs.google.com/presentation/d/1o3WnEUpmqHUaQxK-rd3IV26Oeh2SSDYOb0Ri3oRj9xs/edit#slide=id.g1443746b288_0_5
    page 5, 6



-Key Ink Variables / State Tracking - describing the tools Inks provides were used in your game

    scoreboard_essentials tracks how many resources the community has
        If the player has too few after a day/night cycle, they get a bad ending where the community can’t survive.
    scoreboard_community_score tracks how many “non-essential” resources the player has gathered.
        Don’t get enough of these, and the player won’t get the good ending (they’ll get the normal end or Death End).
    current_location and time_currentTime track where and when the player is.
        This determines where the player can travel and what storylets are available.
    playerHealth and scoreboard_ammo keep track of how much health and ammo the player has.
        These are used for combat segments. The player dies if they lose in combat, resulting in a death ending.



-Ink affordances: Text/Code

	We made use of threads to make storylets and tunneling for various repeated text.Stitches were occasionally used in places where we needed to divert to a specific point in a knot.

----example 1:

    You pass through the main doors of the train station.
    Date: 7/2/2030
    Time: 9:00
    Ammo: 10
    It is freezing inside the train station, even colder than the outside for some reason. You feel a chill run through your body.
    "I better be quick." you mumbled.
    You follow your memory and start heading towards where you can possibly find useful loot.
    Wait.
    Check your status.
    Look for loot in the train station.
    Go to the train station entrance.
    Go upstairs.



    explain:
    
    There is an hourly loop used to decide what is available to the player every hour in the day/night cycle.
    This is used to give the player a limited set of free actions to explore the map and to trigger events .
    Available storylets are presented via this loop.
    There is a world map that lets the player go back and forth.
    This was made using a LIST of locations and VARs for each location storing what they are connected to.
    Different area descriptions and available storylets are presented in different locations.
    A storylet system based on what we did in class is used to present content based on time and place.
    Storylets interact with the map and hourly loop.
    Storylet properties include time, location, and repeatability.


----example 2:

	== function convertRecalculateCommunityResources()
	~ convertInventoryToCommunityScore()
	~ convertInventoryToFoodWaterEssentials()

	~ convertFoodWaterMiscToEssentials()

	~ recalculateCommunityScore()
	
	explain:
	Here uses functions to convert inventory items to community resources and score.

----example 3:
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

	explain:
	Here we are using threads to implement storylets. (Storylets are enabled at the end in case a storylet disables other storylets for a loop. Commented-out storylets were for testing purposes.)


----example 4:

	== travel_actions(->ret)
	+ {canTravel(home)} [Go home.]
		With practiced steps, you follow the road back to the base.
		-> travel(home) ->
	+ {canTravel(military_base)} [Go to the military base.]
		You start heading towards the entrance to San Tose, the military base.
		-> travel(military_base) ->
	+ {canTravel(train_station)} [Go to the train station entrance.]
		You walk toward the train station.
		-> travel(train_station) ->
	+ {canTravel(residential_district)} [Go to the residential district.]
		You travel to the residential district.
		-> travel(residential_district) ->
	+ {canTravel(shopping_mall)} [Go to the shopping mall.]
		You take the main road to the shopping mall.
		-> travel(shopping_mall) ->
	+ {canTravel(warehouse)} [Go to the warehouse.]
		You head inside one of the warehouses without making a sound.
		-> travel(warehouse) ->
	+ {canTravel(underground)} [Go into the upper underground tunnels.]
		You delve into the tunnels underneath the military base.
		-> travel(underground) ->
	+ {canTravel(underground_deep)} [Go into the lower underground tunnels.]
		With tentative steps, you venture further underground.
		-> travel(underground_deep) ->
	+ {canTravel(train_station_inside)} [Go inside the train station.]
		You pass through the main doors of the train station.
		-> travel(train_station_inside) ->
	+ {canTravel(train_station_upstairs)} [Go upstairs.]
		You climb the stairs to the upper levels.
		-> travel(train_station_upstairs) ->
	+ {canTravel(1_story_house)} [Go to the one-story house.]
		You enter the one story house through an open window.
		-> travel(1_story_house) ->
	+ {canTravel(2_story_house)} [Go to the two-story house.]
		The door to the two story house has broken down, so it is easy to enter.
		-> travel(2_story_house) ->
	+ {canTravel(mall_left_wing)} [Go to the left wing.]
		You make your way to the left wing of the mall.
		-> travel(mall_left_wing) ->
	+ {canTravel(mall_right_wing)} [Go to the right wing.]
		You go to the right wing of the mall.
		-> travel(mall_right_wing) ->
	- ->ret

	explain:
	Tunnels are used throughout in places where text needs to be displayed as part of another section. This part, which shows travel text and then tunnels to the travel "function" is one.
	There were a lot of pieces of code that felt like they should have been functions, but needed to divert. In this case, travel(location) needs to tunnel to passTime(hours), which needs to be able to divert when a random encounter occurs.
	
	
----example 5:

	== passTime(hours)
	-> passTimeStart(hours)
	= passTimeStart(hours)
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
	-> passTimeEnd
	= passTimeEnd
	->->
	
	explain:
	Here is a use of stitches to be able to divert to part of a knot. In this case, I wanted passTime(hours), as a tunnel, to return from where it is called, so I made combat divert back to it. Since I can't have passTime(hours) be called again, I used a stitch to divert to the end of the knot.

-Discourse Example/Demonstration

----example 1:

    You are fighting a zombie.
    {RANDOM(1,100) <= playerDodgeChance:
    You are attacked by the zombie, but you are able to dodge.
    - else:
    the zombie attacks, dealing {enemyDamage} damage!
    }
    -> damagePlayer(enemyDamage) ->

    +[Swing at the zombie.]



    explain:

    The event is triggered by the randomness during the day/night cycle
    Players control the characters to fight against zombie
    The result may lead players to different ending.


----example 2:

    *[...take stock of your materials.]
    {scoreboard_community_score < 50:
    -> END
    }
    {scoreboard_community_score < 80:
        ->defensive_1_normal_end
    }
        ->defensive_1_good_end



    explain:
    Ending is different based on how much points you earned from the day/night cycle
    Player won’t directly interact and choose their ending, but all actions matter.
    They won’t know until the end of the day


----example 3:
    
    Then quickly he walks to you,  picks up your stuff, and put them on his shoulder.
    "Thank you man!"
    "You are welcome!"
    *[Look around.]
    You look around, and notice the storage room is full of the food, weapons. There are way more enough for the current size of the community. And also, they are more than what you offered. 
    There are two faces popping up in your head. It must be them.


    explain:
    Simple transition between text 1 and text 2
    This helps the player to easily understand and notice “this is the story”. Since we have day/night cycle that embedded, we want player to take some break and enjoy the story


----example 4:
	
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

	explain:
	This is the day/night cycle code which shows the active storylets and places the player can travel, as well as important info from the ui_display tunnel, such as the date, time of day, and how much ammo the player has.


----example 5:
	
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
	
	explain:
	This is an example of a storylet. It is repeatable and shown everywhere since the player can check their status whenever they want as much as they want during the day/night loop. statusStoryletStart and End are properties saying what time in the day ther storylet is available. statusStoryletCooldown, statusStoryletTimeSincePlayed, and status_storylet_time(hours) are there as a way to not let the player repeat a storylet until a certain amount of ingame time has passed. We didn't really end up using this.

-Something Cool

Day/Night circle
Randomness (in scavenging loot and zombie encounters)
Every route has different supplementary events that help you understand the story on different sides (for example, normal ending different explains the teddy bear gift, but in good ending, teddy got explained.)
Every route has different constituent events too, but the player can see what makes the story different due to the different action at the end of the day.
(by Julian’s comments)
Detailssss (bullet in gun, teddy bear)



-Resources used
Ink Writer’s Manual