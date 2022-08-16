//community management code goes here
VAR scoreboard_community_score = 0
    VAR community_task_10 = 10
    VAR community_task_20 = 20
    VAR community_task_50 = 50

VAR community_population_count = 0
VAR community_population_dead = 0

VAR community_food = 0
VAR community_water = 0
VAR community_structural_integrity = 0
VAR community_firepower = 0

== function convertInventoryToCommunityProgress()
~ convertInventoryToFood()
~ convertInventoryToWater()
~ convertInventoryToStructuralIntegrity()
~ convertInventoryToFirepower()

== function convertInventoryToFood()
~ community_food += bagsOfFood
~ community_food += militaryMREs * 2

~ bagsOfFood = 0
~ militaryMREs = 0

== function convertInventoryToWater()
~ community_water += bottlesOfWater
~ community_water += smallTanksOfWater * 2

~ bottlesOfWater = 0
~ smallTanksOfWater = 0

== function convertInventoryToStructuralIntegrity()
~ community_structural_integrity += woodPlanks
~ community_structural_integrity += bricks * 2
~ community_structural_integrity += concrete * 3
~ community_structural_integrity += militaryGradeSteel * 4

~ woodPlanks = 0
~ bricks = 0
~ concrete = 0
~ militaryGradeSteel = 0

== function convertInventoryToFirepower()
~ community_firepower += handguns
~ community_firepower += boltActionRifles
~ community_firepower += AR15s

~ handguns = 0
~ boltActionRifles = 0
~ AR15s = 0

== function convertInventoryToCommunityScore()
~ scoreboard_community_score += bagsOfSeeds
~ scoreboard_community_score += gasoline
~ scoreboard_community_score += vehicles