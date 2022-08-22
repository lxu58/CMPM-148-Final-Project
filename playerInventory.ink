//inventory variables here
VAR scoreboard_ammo = 0
    VAR ammo_get_10 = 10
    VAR ammo_use_1 = -1
    VAR ammo_use_10 = -10
    VAR ammo_use_30 = -30

VAR bottlesOfWater = 0
VAR bagsOfFood = 0
VAR militaryMREs = 0

VAR firstAidKits = 1
VAR fryingPans = 0
VAR bagsOfClothing = 0

VAR handguns = 1
VAR boltActionRifles = 0
VAR AR15s = 0
VAR emergencyAxes = 0
VAR securityTasers = 0

VAR bulletproofVests = 0
VAR riotShields = 0

VAR woodPlanks = 0
VAR bricks = 0
VAR brokenSteelGates = 0
VAR concrete = 0
VAR militaryGradeSteel = 0

VAR bagsOfSeeds = 0
VAR gasoline = 0
VAR vehicles = 0

== displayInventory
Your Inventory:
........................................
{bottlesOfWater > 0: Single-Liter Water Bottles: {bottlesOfWater}}
{bagsOfFood > 0: Bags of Packed Food: {bagsOfFood}}
{militaryMREs > 0: Military MREs: {militaryMREs}}

{firstAidKits > 0: First-Aid Kits: {firstAidKits}}
{fryingPans > 0: Frying Pans: {fryingPans}}
{bagsOfClothing > 0: Bags of Clothing: {bagsOfClothing}}

{scoreboard_ammo > 0: Ammo: {scoreboard_ammo}}
Personal Handgun: 1 //just to explain why the player can always shoot zombies
{handguns > 0: Handguns: {handguns}}
{boltActionRifles > 0: Bolt Action Rifles: {boltActionRifles}}
{AR15s > 0: AR-15s: {AR15s}}
{emergencyAxes > 0: Emergency Axes: {emergencyAxes}}
{securityTasers > 0: Security Tasers: {securityTasers}}

{bulletproofVests > 0: Bulletproof Vests: {bulletproofVests}}
{riotShields > 0: RiotShields: {riotShields}}

{woodPlanks > 0: Wood Planks: {woodPlanks}}
{bricks > 0: Bricks: {bricks}}
{brokenSteelGates > 0: Broken Steel Gates: {brokenSteelGates}}
{concrete > 0: Concrete: {concrete}}
{militaryGradeSteel > 0: Military-Grade Steel: {militaryGradeSteel}}

{bagsOfSeeds > 0: Bags of Seeds: {bagsOfSeeds}}
{gasoline > 0: Gasoline: {gasoline}}
{vehicles > 0: Vehicles: {vehicles}}
........................................

->->