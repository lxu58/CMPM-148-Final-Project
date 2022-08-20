//this file contains code for combat and receiving damage

//variables so you can tell what happened during the last fight
//lost probably won't come up since that will probably mean death?
LIST combatResults = won, lost, fled, no_combat_yet
VAR lastCombatResult = no_combat_yet

VAR playerDodgeChance = 10

//i dont think this makes much sense as a storylet, but idk
== combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ->ret)
{enemyHealth <= 0:
    ~ lastCombatResult = won
    You see that {enemyName} has fallen to the ground, dead.
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
    They attack, dealing {enemyDamage} damage!
}
-> damagePlayer(enemyDamage) ->

+[Punch {enemyName}.]
    {RANDOM(1,100) > enemyDodgeChance:
        You swing your fists at the enemy, dealing 1 damage.
        ~ enemyHealth -= 1
    - else:
        You miss your punch!
    }
    ->combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
+{scoreboard_ammo > 0} [Shoot {enemyName} (Costs 1 Ammo).]
    {RANDOM(1,100) > enemyDodgeChance:
        You shoot {enemyName}, dealing 3 damage.
        ~ enemyHealth -= 3
    - else:
        You miss your shot!
    }
    ->combat(enemyName, enemyHealth, enemyDamage, enemyDodgeChance, ret)
+[Flee.]
    ~ lastCombatResult = fled
    You run away as fast as you can.
    ->ret

//note that this is a knot, not a function, so it can divert to dead
== damagePlayer(health_to_lose)
~ playerHealth -= health_to_lose
{playerHealth <= 0: ->dead}
->->

== dead
You are dead!
->END