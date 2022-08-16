//this file contains code for combat and receiving damage


//i dont think this makes much sense as a storylet, but idk
== combat(enemyName, enemyHealth, enemyDamage, ->ret)
{enemyHealth <= 0:
You see that {enemyName} has fallen to the ground, dead.
->ret
}

Health: {playerHealth}
Enemy Health: {enemyHealth}
Ammo: {playerAmmo}

You are fighting {enemyName}.
They attack, dealing {enemyDamage} damage!
-> damagePlayer(enemyDamage) ->

+[Punch {enemyName}.]
    You swing your fists at the enemy, dealing 1 damage.
    ~ enemyHealth -= 1
    ->combat(enemyName, enemyHealth, enemyDamage, ret)
+{playerAmmo > 0} [Shoot {enemyName} (Costs 1 Ammo).]
    You shoot {enemyName}, dealing 3 damage.
    ~ enemyHealth -= 3
    ->combat(enemyName, enemyHealth, enemyDamage, ret)
+[Flee.]
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