VAR got_weapons = false

== intro
text blah blah

*[Twitch fingers and try to get up.]
    more text blah blah
    
**[Open your eyes.]
    even more text
        
***[Lift up your upper body.]
    you know the drill
                
****[word]
    super text
                        
*****[Stand up.]
    hyper text (get it?)

******[Defend yourself.]
    (should a combat segment go here?)

*******["Gray..."]
    -> intro.choice
    = choice
    uwu grey-senpai
    ********[Take energy bar.]
        -> intro_take_energy_bar
    ++++++++[Burn and clean out the dead bodies.]
        -> intro_burn_bodies

== intro_take_energy_bar
    mmm tasty energy bar
-> intro_burn_bodies

== intro_burn_bodies
{not intro_take_energy_bar:
    too tired, cannot burn bodies
    -> intro.choice
}
more words
* [Start talking.]
    talking talking
    
**[plan]
    planning planning
    
***[sleep]
    ZZZZZzzzzZZZZZzzzzZZZZZZZZZzzzzzz...

****[Get up.]
    no u

*****[The other two?]
    toe
    ******[Military Base: San Tose]
        ->END
    ******[Train Station: Main Drive Station]
        ->END
    ******[Residential District: Heaven]
        ->END
    ******[Shopping Mall: Lu's Toe]
        booze
        *******[I am ready.]
            ->intro_toward_shopping_mall

== intro_toward_shopping_mall
+ [Move west.]
    -> intro_move_west
+ [Explore the area.]
    ->intro_explore_area
+ [Talk to Gray.]
    ->intro_talk_to_gray
    
== intro_move_west
    {intro_move_west == 1:
        You go toward the shopping mall.
        ->intro_toward_shopping_mall
    }
    {intro_move_west == 2:
        You are getting close to the mall.
        ->intro_toward_shopping_mall
    }
    {intro_move_west > 2:
        arrive
        *[check inside]
        ->intro_shopping_mall
    }
    
== intro_explore_area
    {intro_explore_area == 1:
        find corpse
        ~ got_weapons = true
        ->intro_toward_shopping_mall
    - else:
        found nothing
        ->intro_toward_shopping_mall
    }
    
== intro_talk_to_gray
    {intro_talk_to_gray == 1:
        conversation
    - else:
        "we have no time to waste >:("
    }
    ->intro_toward_shopping_mall
    
== intro_shopping_mall
    {got_weapons:
     *[I've got some weapons and a good place to live. You wanna join me?]
        **[You package the stuff and head back to your base.]
            ->intro_base
        
    }
    *[We can do business. How can I help?]
        go get weapons
        **[Start exploration around this place.]
            you found it
            ~ got_weapons = true //may not be useful here
            ***[base]
                ->intro_base
    *[Business should be win-win. I don't make losing trades.]
        ->END

== intro_base
    writing in your journal
    *[THE NEXT DAY]
        ->END