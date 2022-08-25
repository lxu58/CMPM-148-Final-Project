# CMPM-148-Final-Project

Note: The following content is same as content in TheLastHope.writeup


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
    https://jamboard.google.com/d/1xsHuawjF7x2fIhaO6PGTuZsM1Sb96ptWH3fNOQWgkgM/viewer?f=0
    I made a world based on how we plan, but we run out of time becasue of the lack of the management in first two weeks, the plan of the story is about 50k words long and every route is about 80k, but at the end, we only made one community (one route), and I am trying to make this as much details as possible for player to understand the world I am making. The exploring cycle and events are made by Pengfei, it has some conflict against the setting up, also since we don't have time to do second polishing, the story might have some conflict too. It's totally understandable and also we all did as much as we can within the time we have. Despite of that, it was so fun for me to make a story with the theme of zombie dystopia. I was so panicing making something without adventure and romantic because those are something I usually plan and write (my comfort room), but it's totally worthwhile to think about this story and write them done.




-Experience Goal - describing the player experience goal

    includes themes of construction, survival, exploring, and relationship building. The goal is to make the player be more rational and stressed by making choices that will impact the end goal as well as making them experience the thrill of surviving zombies’ attacks, and enjoy the different ending through the decision made by themselves


-Narrative Stance and Rationale - how the story structure/architecture shapes its meaning

    The story majorly talks in a third person style, but once it enters the final chapter, it may switch to the first person to “Roger” or “Gray to modify the characters’ change. Normally, the focal point is Roger, but it changes base the the story line. The narrator is unreliable (such as memory lost). also the sub ending (normal ending)  is used as supplementary events to make players to understand the truth of the story.

    The unreliable narrator push players to search for supplementary events to understand the truth. Every ending has important and unique message about the truth, but none of them will reveal the truth itself on that route.

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

    example:

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





-Discourse Example/Demonstration

    example 1:

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


    example 2:

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


    example 3:
    
    Then quickly he walks to you,  picks up your stuff, and put them on his shoulder.
    "Thank you man!"
    "You are welcome!"
    *[Look around.]
    You look around, and notice the storage room is full of the food, weapons. There are way more enough for the current size of the community. And also, they are more than what you offered. 
    There are two faces popping up in your head. It must be them.


    explain:
    Simple transition between text 1 and text 2
    This helps the player to easily understand and notice “this is the story”. Since we have day/night cycle that embedded, we want player to take some break and enjoy the story






-Something Cool

Day/Night circle
Randomness
Every route has different supplementary events help u understand the story on different side (for example, normal ending different explains the teddy bear gift, but in good ending, teddy got explained)
Every route has different constituent events too, but player can see what makes the story different due to the different action at the end of the day.
(by Julian’s comments)
Detailssss (bullet in gun, teddy bear)



-Resources used
Ink Writer’s Manual