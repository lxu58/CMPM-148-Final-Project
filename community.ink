//community management code goes here
VAR scoreboard_community_score = 0
    VAR community_task_10 = 10
    VAR community_task_20 = 20
    VAR community_task_50 = 50

//VAR community_population_count = 0
//VAR community_population_dead = 0

VAR scoreboard_essentials = 0
    VAR community_food = 0
    VAR community_water = 0
    VAR community_misc_essentials = 0
    VAR community_structural_integrity = 0
    VAR community_firepower = 0
    VAR community_misc = 0

VAR COMMUNITY_DAILY_ESSENTIALS_CONSUMPTION = 20

== function convertRecalculateCommunityResources()
~ convertInventoryToCommunityScore()
~ convertInventoryToFoodWaterEssentials()

~ convertFoodWaterMiscToEssentials()

~ recalculateCommunityScore()

== function convertInventoryToCommunityScore()
~ convertInventoryToStructuralIntegrity()
~ convertInventoryToFirepower()
~ convertInventoryToMisc()

~ recalculateCommunityScore()

== function recalculateCommunityScore()
~ scoreboard_community_score = 0
~ scoreboard_community_score += community_structural_integrity
~ scoreboard_community_score += community_firepower
~ scoreboard_community_score += community_misc

== function convertInventoryToFoodWaterEssentials()
~ convertInventoryToFood()
~ convertInventoryToWater()
~ convertInventoryToMiscEssentials()

== function convertFoodWaterMiscToEssentials()
~ scoreboard_essentials = 0
~ scoreboard_essentials += community_food
~ scoreboard_essentials += community_water
~ scoreboard_essentials += community_misc_essentials

~ community_food = 0
~ community_water = 0
~ community_misc_essentials = 0

== function convertInventoryToFood()
~ community_food += bagsOfFood
~ community_food += militaryMREs * 2

~ bagsOfFood = 0
~ militaryMREs = 0

== function convertInventoryToWater()
~ community_water += bottlesOfWater

~ bottlesOfWater = 0

== function convertInventoryToMiscEssentials
~ community_misc_essentials += fryingPans
~ community_misc_essentials += firstAidKits * 4 //first aid kits have a use to the player, so i made them worth more
~ community_misc_essentials += bagsOfClothing

~ firstAidKits = 0
~ fryingPans = 0
~ bagsOfClothing = 0

== function convertInventoryToStructuralIntegrity()
~ community_structural_integrity += woodPlanks
~ community_structural_integrity += bricks * 2
~ community_structural_integrity += brokenSteelGates * 2
~ community_structural_integrity += concrete * 3
~ community_structural_integrity += militaryGradeSteel * 4

~ woodPlanks = 0
~ bricks = 0
~ brokenSteelGates = 0
~ concrete = 0
~ militaryGradeSteel = 0

== function convertInventoryToFirepower()
~ community_firepower += handguns
~ community_firepower += boltActionRifles * 2
~ community_firepower += AR15s * 3
~ community_firepower += emergencyAxes
~ community_firepower += securityTasers

~ community_firepower += bulletproofVests * 2
~ community_firepower += riotShields * 3

~ handguns = 0
~ boltActionRifles = 0
~ AR15s = 0
~ emergencyAxes = 0
~ securityTasers = 0

~ bulletproofVests = 0
~ riotShields = 0

== function convertInventoryToMisc()
~ community_misc += bagsOfSeeds
~ community_misc += gasoline
~ community_misc += vehicles * 3

~ bagsOfSeeds = 0
~ gasoline = 0
~ vehicles = 0