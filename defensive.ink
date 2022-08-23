VAR flag_W_Route = false
VAR flag_Gray_Route = false

== defensive_intro
//default start for defensive, lower than this will result in death
~scoreboard_essentials = 20
~scoreboard_ammo = 10
//UI = true //pointless
\-- Chapter 3: Defensive: Infesting Heart --

Next Day.

You get up from your simple assembled bed, and you feel your head is still not ready to put all of your memories together, but now, you know there are more important things to do rather than swimming and thinking in the sea of the memory. 

"J, what's he up to, I barely know him, it's to ask my new friend."

You brush your teeth and make yourself ready for the conversation. Suddenly, you heard some argument in front of the J's camp. 
* [Get close and listen.]
    You quickly saw the source of the argument. It was Gray and J. 

    Gray's face is hideous. In contrast, J is somehow enjoying this argument, he is like treating an angry poppy. 

    There must be something happened to them.
    ** [Leave. That's none of your business.]
        Once you finish the breakfast, you check the essentials and materials you have. 

    "That's not enough for all of us. Damn it. "

    You can sense a tiny piece of regret coming from the deep place of your heart, and it's accompanied with something dark, evil, and full of selfishness.

    "No, it's not the time." You are wispering like a misquote.

    Few minutes later, you find yourself standing in front of the gate of the base.

        ~flag_W_Route = true
        ***["Time for some honey!"] //????
            //~UI = true
            ->day_loop
//    ** [Go listen to what they're saying.]
//        this will lead u to find another community in progress
//        ~flag_Gray_Route = true
//        ~ UI = false
//       ->END


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
//~scoreboard_essentials = 20
//~scoreboard_ammo = 10
~ convertRecalculateCommunityResources()

~currentLocation = home

Night time, you get back from the exploration, and give the M as much supplement as possible, seems like M really respects you for helping his and J's people. 

"Is this the characteristics of a good business man?" M asked.

"Yes, but not a business man anyone, I have no memory, no company, and no...."

"It doesn't matter anymore pal, the present means everything in the world like this."

You just notice, it's the first time talking to M, this man has the same shape as J, and but he seems like a normal person. You heard a lot from people from this community, they said M is rude and considerate, now you kinda know what does these mean.

You are sure, you will get involved with him more in the future. 

You look at his back when he carries the last container with his shoulder and then, he walks into the storage room, and gives you a gesture.
*[Time to leave.]
    //->passTime(2)-> //how long should this storylet take?
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
//~scoreboard_essentials = 20
//~scoreboard_ammo = 10

~currentLocation = home
~zombies_enabled = true

"Morning!" 

You open eyes and see a tall, tough man standing in front of your bed.

You don't know why he is here, and more strange thing is he holds a cup of coffee and seems like it's for you.

"M?"

"Yeah, if you are wandering where your friend is, he is probably spending time with J, I am sure they have a lot of things to talk, since they are pretty similar."

Right now, you don't know what he means by similar, maybe you should get along with Gray more to know more about him. 

"J got psychological problem after he saw his wife and daughter got killed by the zombies" W continue the talk. 

"It's a tragedy, isn't it. The life is truely changing a person. J was a brave comrade when we served at the same troop, but now, I just want to help him to get over the wound."

"Did they have an argument yesterday". You asked.

You stand up and take the coffee M brought you,
*[...and listen to what he might say.]
M waits until you take a sip of the coffee from the top of the cup, and start talking about the argument yesterday.

"They all have different views about the world, but the argument may help them understand that they are not the only one."

"Do they know each other? I know Gray is really sensitive person. He is always careful when he stays with stranger. Yesterday..."

"Same as J, no one is innately careful like this, the past changed them." M added.

You see Gray and Mr.J talks in front of the tent, but unlike yesterday, they are talking normally this time, and Mr.J is not getting crazy at all.
**[Go ahead and say hello.]
"Yo, was the solo adventure fun yesterday? " Gray is annoying as normal. 

"It was tough, are you heading out today, Gray?" 

"Not really, J just told me there are more people he knew are still in this area, I am going to help them with J for the next 3 days. "

"No worry, my dear business man, my right hand M will help you out." Mr. J said. It seems like he is ready to hang out with Gray. 

You are wondering where does those revolution friendship come from between these two. 
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
//~scoreboard_essentials = 20
//~scoreboard_ammo = 10
~ convertRecalculateCommunityResources()

~currentLocation = home

Just like yesterday, you and M put most of the extra materials into the storage room. You just notice M is seriously managing the storage, he doesn't allow anyone to help him take out or move in the supplement.

You wait him until he finishes today's supplement distribution. 

He starts talking once he finished his job. "J and your friend brought a lot of people back today. They really did something great, right? Glad you have a friend that is this good! It has been long time haven't seen J smiles like this. "

"Gray is my secretary, or body guard, but to be honest, I don't know him a lot."

"What? Have you ever trying to know his background or his life. I mean you still remember he is your secretary right? Anything related to that should be clear or at least you still remember pieces of it"

"I don't know, I don't know man. Something might happen to us, My head is refusing to remember the story about Gray."

M sighs deeply and begins to speak.

*[Listen to M's reply.]
"Don't let it become too late to know your friend"

M's word reminds you of how you treat people in the past. You always put people on the side of the balance and use "benifits and money" to measure their value. 

That makes you "miscalculate" your friend until that day.

"Maybe" a slight feeling of suspicion crept over me, but you still think you are doing right at least for you and for people around you. 

"And what's your name?＂you asked.

"Call me William" 

You don't know if that is an illusion, W, William got slight satisfaction on his face for a short second.

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
//~scoreboard_essentials = 20
//~scoreboard_ammo = 10
-> defensive_resources_update_check() ->

~currentLocation = home
You wait William to do the material distribution, and you quickly saw a young girl about age of 10 waving hand at William, and William smells at her, and then that girl quickly walk away from the storage room.

"It's my girl. She is cute isn't it. " William uses a finger to point at the container, and use a gesture to ask you to follow him.

You unskilledly packaged the container and hold it with two hands, but it still too heavy for you. 

"Very adorable, is this why you pick this as your job." 

William stops and looks at you.  "You are quite insight peson you know. Even in this bastard world, I still want to keep a safe room for my girl and her mom, they deserve better. As least, to have a job like this, they know they don't need to worry about the future because daddy is the resource manager. " 

Then quickly he walks to you,  picks up your stuff, and put them on his shoulder.

"Thank you man!"

"You are welcome!"

*[Look around.]
You look around, and notice the storage room is full of the food, weapons. There are way more enough for the current size of the community. And aslo, they are more than what you offered. 

There are two faces popping up in your head. It must be them.

"William, do you know where J and Gray are?"

"They found a huge base next to Military Base and Shopping Mall, no one lives in the base but strange thing is, they have a lot of food. So J and Gray, wants to live there tonight to see if it's safe. If everything goes well, we can move to that place with all people here."

**["I see. Let's wait for their news."]
\-- Chapter 4: William and J --

In the morning, you heard some noises. It's from people. Old men, young men, girls, boys. They are talking about something. Sleepiness slowly disappeared. You clearly heard a word "zombies".

You get up quickly, and trying to figure out current situation.

"How was the sleep last night?"

"Gray, nice to see you again", you speak, but before you waiting for the response, you saw William is handing guns to all people living in this community. 

Then, he walks to you and says, "We need more guns and food."

***[Ask what happened.]
Before you can ask, Gray starts speaking. "We found a base, but the people from that base just got infested. There's a good news and a bad news, which one you wanna hear first?" 

Gray is still Graying even in this circumstance. 

"Don't tell me, the people from that base got infested and if we kill them, we get their base and supplies?" You made reasonable guess.

"Exactly, boy! We gotta kill them all with blood and dream!! But we might need MORE ammo and food" The sound is from Mr.J, he is saying those things while playing with William's daughter. 

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
//~scoreboard_essentials = 20
//~scoreboard_ammo = 10

It's clear you know nothing about fighting. The zombies won't attack you, so shooting a gun is usually not necessary for you.

However, you just made a new friend, and his daughter's innocent face still remains in your head and can't be wiped away. 

You think about your past, and you choose to...

*[...run away from the base.]
    Sadly you still choose the way which is most benificial to yourself.

    But it's reasonable because you are a business man.

    You take a deep sigh, and start walking to another place which is safe. 

    "Pap!"

    A bullet pass through your head with brutal sharpy sights. 
    It's from a man you've known from a long time. 
    He mocks you and waits until your heart stops beating.
    ->END
    
*[...take stock of your materials.]
    {scoreboard_community_score < 50:
    -> END
    }
    {scoreboard_community_score < 80:
        ->defensive_1_normal_end
    }
        ->defensive_1_good_end
    

== defensive_1_normal_end
\-- Chapter 5: Roger's Balance --

"Seems like we got enough
*[You notice there is something on the table.]
    It's an old teddy bear. It doesn't have much marks of time on the teddy bear, and it's incrediblly clean, as a business man, you can tell this is something you want to give other people. 

    There is a face flash into your head. It's a girl who is smelling to her father while working. 

    But right now, you don't have time for this, you have to use your action to response to Gray and this community's expectation. 

    You rapidly grabbed a gun and go stay with people who needs help.
    
**[Wait until zombies attack.]
    "Pew!"

    You hear the sound of guns firing one after another. Quickly, it becomes a wave of rain sounds.

    You make up your mind, but you are still hesitant. 

    Hours later, the frequency of the shooting sound has significantly changed. 

    (That isn't good.) you think.

Finally, you choose to go to the frontline and help your comrade.
***[Go to the frontline.]
    Once you arrive, the light from the spotlight immediately pierces through your eyes.

    You do your best to move forward with your eyes closed.

    The stink is devouring you while you are moving forward. 

    Getting close, you can hear two animals yelling at the sea of zombies. 

    "Damn it.“ You urge to figure out the current situation with you half-closed eyes. 

    But the blood, corpes, and death are stopping your brain from thinking. 

    You quickly join them and shoot the gun with your unskillful stance. 

    "How much more do they have?" You are yelling at Gray, but he is not responding, he is getting crazy just like Mr.J next to him. 

    They are slaughterring the zombies like this is what they are living for. 

****[You turn your head toward William.]
    "Is everyone from behind okay?" He asked.

    "That's why I am here." You keep shooting as yelling with all of your energy.

    "Listen, Roger, I need you to do me a favor."

    "What?" You sense something bad, but you know you better not ask what is it.

    "They have too many, we need to go before it's too late."

    You know this will happen, but you still ask and try to find a better answer like a business man "how about you, Gray, and J, and all other people fighting here"

    "None of us can stop. If any of us run away, the zombies will tear us apart like sheeps. and your friend and J have in there world, they can't hear anything now."

    "So are you going to die with them?" 

    (No, no, no.) that's the only answer you are expecting.

    But you know the reality is cruel. William is not saying anything after that. But at the end, he glance at you, and you know it's about time.
    
*****[Start running away.]
    You start run away because you know there is something else you must do. 

    Every step you take, there is something jumping into your head. 

    10 steps away, you head is thinking about Mr. J's crazy face, he is split but he is still doing his best to protect those people.

    20 steps away, you start remembering what William talks you about people. He was stranger couple days ago, but now, are you enough to be his friend.

    30 steps away, you start remembering Gray and a little past fragment about his wife and daughter. They both work for you, but at the end, the people from the department asked you to kill all people who know "the project". And Gray he fought at you in the lab, and you let him punch you because you don't know what else you should do.

    But now, you know you need to take what they left.

    You go find the people hiding in the building, and leaving with them to find another place to live.
    
    \-- Normal End: Survivors -- //idk felt like it needed a name
    ->END

== defensive_1_good_end
\-- Chapter 5: Know About My Friends -- //sudden 1st person? why?
I got up 

*[Walk about the base to see if everyone is okay.]
That's William's daughter

**[Head to the storage room.]
There are still

***[An alarm?]
"This is way early

****["Let me go with you!"]
"You?"

*****\-- Gray's Point of View --
(It's been three days

******[Look at J.]
J looks extremely

*******[Run back to base and ring the alarm.]
\-- Roger's Point of View --
You run to the front

********[Keep running and give a glance at the pistol he handed to you.]
The pistol has no ammo

*********[It's time for the counterattack.]
Night time, zombies'

**********[Read the letter.]
"
Date: 7/6
Target: Cleared

\-- Normal End: Counterattack -- //i just wanna name the endings, okay??!!
->END

->END

== defensive_resources_update_check()
//checking total resources being
~ convertRecalculateCommunityResources()
~ scoreboard_essentials -= COMMUNITY_DAILY_ESSENTIALS_CONSUMPTION

{scoreboard_essentials >= 0:
    ->->
- else:
    -> defensive_death
}

->->

== defensive_death
You didn't bring enough water, food, and weapon back today. The people from Mr.J's community still enjoys the supplement, you know it's a hard decision, but you really need more people to help gathering the living materials from now on. 

Couple days later, more and more people from community died when they were out for exploration, Mr.J is clearly not happy with that. He got crazy and drank all the time since his manager M died from the last exploration. 

You are losing confidence and planning to leave this place, but you can't find Gray anywhere.

"Where did he go..... I am sure he will be okay, I need to go before this base got destroyed by the despair"

You leave the base at the late night, and trying to find a new place to spend your life at.

But a bullet accompanied with the cold wind at night but pass through your head. 
During the last second of your life, you saw a man wearing an elegant glasses as his black cloak dancing in the wind mocking at you. 
-> END