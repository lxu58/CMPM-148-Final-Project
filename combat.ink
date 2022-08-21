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
    {enemyName} has fallen to the ground, dead.
->ret
}

:::::::::::::::::::::::::::::::::::::::
Health: {playerHealth}
Enemy Health: {enemyHealth}
Ammo: {scoreboard_ammo}
:::::::::::::::::::::::::::::::::::::::

You are fighting {enemyName}.
{RANDOM(1,100) <= playerDodgeChance:
    You are attacked by {enemyName}, but you are able to dodge.
- else:
    {enemyName} attacks, dealing {enemyDamage} damage!
}
-> damagePlayer(enemyDamage) ->

+[Punch {enemyName}.]
    {RANDOM(1,100) > enemyDodgeChance:
        You swing your fists at the enemy, dealing 1 damage.
        ~ enemyHealth -= 1
    - else:
        You miss your punch!
    }
    -> combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
+{scoreboard_ammo > 0} [Shoot {enemyName} (Costs 1 Ammo).]
    {RANDOM(1,100) > enemyDodgeChance:
        You shoot {enemyName}, dealing 3 damage.
        ~ scoreboard_ammo -= 1
        ~ enemyHealth -= 3
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
As you lie bleeding on the ground, you dimly wonder what will become of the other survivors. You close your eyes one last time, and blackness overtakes you.
You are dead.
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