//inventory variables here
VAR scoreboard_ammo = 2
    VAR ammo_get_10 = 10
    VAR ammo_use_1 = -1
    VAR ammo_use_10 = -10
    VAR ammo_use_30 = -30

VAR bottlesOfWater = 3
VAR smallTanksOfWater = 0
VAR bagsOfFood = 3
VAR militaryMREs = 0

VAR handguns = 1
VAR boltActionRifles = 0
VAR AR15s = 0

VAR woodPlanks = 0
VAR bricks = 0
VAR concrete = 0
VAR militaryGradeSteel = 0

VAR bagsOfSeeds = 0
VAR gasoline = 0
VAR vehicles = 0

== displayInventory
Your Inventory:
........................................
{bottlesOfWater > 0: Bottles of Water: {bottlesOfWater}}
{smallTanksOfWater > 0: Small Water Tanks: {smallTanksOfWater}}
{bagsOfFood > 0: Bags of Food: {bagsOfFood}}
{militaryMREs > 0: Military MREs: {militaryMREs}}

{scoreboard_ammo > 0: Ammo: {scoreboard_ammo}}
{handguns > 0: Handguns: {handguns}}
{boltActionRifles > 0: Bolt Action Rifles: {boltActionRifles}}
{AR15s > 0: AR-15s: {AR15s}}

{woodPlanks > 0: Wood Planks: {woodPlanks}}
{bricks > 0: Bricks: {bricks}}
{concrete > 0: Concrete: {concrete}}
{militaryGradeSteel > 0: Military-Grade Steel: {militaryGradeSteel}}

{bagsOfSeeds > 0: Bags of Seeds: {bagsOfSeeds}}
{gasoline > 0: Gasoline: {gasoline}}
{vehicles > 0: Vehicles: {vehicles}}
........................................

->->