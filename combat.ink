//this file contains code for combat and receiving damage

//variables so you can tell what happened during the last fight
//lost probably won't come up since that will probably mean death?
LIST combatResults = won, lost, fled, no_combat_yet
VAR lastCombatResult = no_combat_yet

VAR playerDodgeChance = 10
VAR playerFleeChance = 50

VAR zombies_enabled = true

//i dont think this makes much sense as a storylet, but idk
== combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ->ret)
{enemyHealth <= 0:
    ~ lastCombatResult = won
    You survived, for now.
->ret
}

:::::::::::::::::::::::::::::::::::::::
Health: {playerHealth}
Enemy Health: {enemyHealth}
Ammo: {scoreboard_ammo}
:::::::::::::::::::::::::::::::::::::::

You are fighting a zombie.
{RANDOM(1,100) <= playerDodgeChance:
    You are attacked by the zombie, but you are able to dodge.
- else:
    the zombie attacks, dealing {enemyDamage} damage!
}
-> damagePlayer(enemyDamage) ->

+[Swing at the zombie.]
    The zombie quickly approaches and lunges at you while you swing your weapon at them.
    {RANDOM(1,100) > enemyDodgeChance:
        Your hit connects with a thud, dealing 1 damage.
        ~ enemyHealth -= 1
        {enemyHealth <= 0:
            You barely dodge the zombie's attack and swing back at its head with all your strength.
            A crushing sound can be heard from the zombie's head before it flies off the zombie's neck.
        }
    - else:
        Your weapon swings past the zombie, hitting only air.
    }
    -> combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
+{scoreboard_ammo > 0} [Shoot the zombie (Costs 1 Ammo).]
    Luckily there is still ammo in your gun and you quickly aim at the zombie who is approaching dangerously close.
    Bang!
    {RANDOM(1,100) > enemyDodgeChance:
        Your shot connects, dealing 3 damage to the zombie.
        ~ scoreboard_ammo -= 1
        ~ enemyHealth -= 3
        
        {enemyHealth <= 0:
            After a few shots, including a critical hit to the head, the creature finally stops, but you can still see its body twitching.
        }
    - else:
        ~ scoreboard_ammo -= 1
        You miss your shot!
    }
    -> combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
+[Flee.]
    {RANDOM(1, 100) < playerFleeChance:
        ~ lastCombatResult = fled
        You run away as fast as you can.
    -else:
        You tried to flee, but you couldn't get away!
        -> combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
    }
    ->ret

//note that this is a knot, not a function, so it can divert to dead
== damagePlayer(health_to_lose)
~ playerHealth -= health_to_lose
{playerHealth <= 0: ->dead}
->->

== dead
You try desperately to fight off the zombie, however it does not seem to care about its wounds and continues to lunge at you.
Before you can take another move, you are pinned down to the ground and the last thing you see is the zombie's enormous mouth in front of your face.
As you approach death, you dimly wonder what will become of the other survivors. You close your eyes one last time, and blackness overtakes you.
You are devoured whole.
->END

== chance_encounter(percent_chance, ->ret)
//dont have a zombie encounter if zombies are disabled
{zombies_enabled == false:->ret}
{storylets_enabled == false: ->ret}

~temp random_number = RANDOM(1, 100)
{random_number}
{random_number <= percent_chance:
    A zombie shambles toward you!
    -> combat("Zombie", 5, 1, 10, ret)
-else:
    ->->
}
->->