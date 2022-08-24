//this file contains code for locations

VAR travelBlocked = false //might be useful

LIST allLocations = home, military_base, train_station, residential_district, shopping_mall, warehouse, underground, underground_deep, train_station_inside, train_station_upstairs, 1_story_house, 2_story_house, mall_left_wing, mall_right_wing
VAR currentLocation = home

//here we list where is connected to where, it's basically the map
VAR connectedToHome = (military_base, train_station, residential_district, shopping_mall)
    VAR connectedToMilitaryBase = (home, warehouse, underground)
        VAR connectedToWarehouse = (military_base)
        VAR connectedToUnderground = (military_base, underground_deep)
            VAR connectedToUndergroundDeep = (underground)
    VAR connectedToTrainStation = (home, train_station_inside)
        VAR connectedToTrainStationInside = (train_station, train_station_upstairs)
            VAR connectedToTrainStationUpstairs = (train_station_inside)
    VAR connectedToResidentialDistrict = (home, 1_story_house, 2_story_house)
        VAR connectedTo1StoryHouse = (residential_district)
        VAR connectedTo2StoryHouse = (residential_district)
    VAR connectedToShoppingMall = (home, mall_left_wing, mall_right_wing)
        VAR connectedToMallLeftWing = (shopping_mall, mall_right_wing)
        VAR connectedToMallRightWing = (shopping_mall, mall_left_wing)

//test if locations are connected to other locations here
== function canTravel(location)
{travelBlocked: 
    ~return false
}
{ currentLocation:
    -home:
        ~ return connectedToHome ? location
    -military_base:
        ~ return connectedToMilitaryBase ? location
    -train_station:
        ~ return connectedToTrainStation ? location
    -residential_district:
        ~ return connectedToResidentialDistrict ? location
    -shopping_mall:
        ~ return connectedToShoppingMall ? location
    -warehouse:
        ~ return connectedToWarehouse ? location
    -underground:
        ~ return connectedToUnderground ? location
    -underground_deep:
        ~ return connectedToUndergroundDeep ? location
    -train_station_inside:
        ~ return connectedToTrainStationInside ? location
    -train_station_upstairs:
        ~ return connectedToTrainStationUpstairs ? location
    -1_story_house:
        ~ return connectedTo1StoryHouse ? location
    -2_story_house:
        ~ return connectedTo2StoryHouse ? location
    -mall_left_wing:
        ~ return connectedToMallLeftWing ? location
    -mall_right_wing:
        ~ return connectedToMallRightWing ? location
}

//adds an hour onto the time and changes the location
== travel(location)
-> passTime(1) ->
~ currentLocation = location
->->

// here you can put a description of the current location
== function describeCurrentLocation()
{ currentLocation:
	-home:
        You stand in front of your base and start to decide where should you go to search for resources. "The Military Base should contain more firearm related resource, the Train Station should have items that can help reinforce the base, the Residential District could have a little of everything, and the Shopping Mall should have plenty of food related resources." you mumbled to yourself.
	-military_base:
        From the outside, the military base looks like a group of warehouses surrounded by steel wires. You've heard that the base consists of 2 levels, the warehouses you see above the ground and the secret control room underground.

        After passing through a hole in the wires with cautious, you end up in front of a warehouse.
    -train_station:
        You remember coming to this train station before the apocalypse. Now, this place is long abandoned with dead bodies of humans and zombies all around. Even though your body is rejecting to go in there, but you know this is one of the few places that could have resources. There's no choice but to go inside.
    -residential_district:
        This place used to be home for thousands of people. Now, it's a wasteland full of corpses and trash everywhere. Even the birds refuse to come here anymore.

        You are walking along the pavement looking for any houses that seem to contain resource in them. You quickly locate a few.
    -shopping_mall:
       This shopping mall used to be one of the biggest in town, it had all kinds of restaurants and stores inside. You recalled. At the entrance, you can see some broken barriers made out of chairs and vending machines.

    "Looks like they did not survive the attack." you say to yourself after seeing the gaps between barriers and the corpses lying everywhere.
    -warehouse:
        The warehouse seems to store all kinds of military rations. However, most of the containers seems to be broken and empty.
    -underground:
        The underground tunnels are sealed with darkness. You can barely see a thing. Luckily, there is flashlight on you.

        The rooms are filled with deteriorated boxes with blood stains on them. There is a rotten and decaying smell lingering in the air. You can only hear your own foot steps as you move foward.
    -underground_deep:
        "I should keep going until I find some loot." you repeat to yourself even though there's clearly some hesitation in the tone.
        Your effort and courage is not futile, you find boxes full of resources within.
    -train_station_inside:
        It is freezing inside the train station, even colder than the outside for some reason. You feel a chill run through your body.

        "I better be quick." you mumbled.

        You follow your memory and start heading towards where you can possibly find useful loot.
    -train_station_upstairs:
        Upstairs are where the trains arrive and depart. All there is, are some benches and dead bodies.

        "A waste of time," you sigh in disappointment.
    -1_story_house:
        This house looks relatively untouched on the outside unlike other ones. That's probably because it doesn't look as outstanding as the other houses around it, however that makes a perfect choice for you.

        "Hopefully there's something I can use inside." you say to yourself.

        Inside is just like any other ordinary home, you start to look for resources.
    -2_story_house:
        The 2 story house looks a lot nicer than the 1 story house, however it's also more demolished. It has a front yard, a back yard, and even a pool. But everything is in pieces now.

        You waste no time and head inside for loot.
    -mall_left_wing:
        The left wing of the mall are mostly clothes and jewelry stores. As you are walking along, you noticed a phenomenon.

        "People would plunder jewelry stores even during the apocalypse." you shake your head in disbelief.

        After a short walk, you quickly notice a few stores that may contain useful resources.
    -mall_right_wing:
        The right wing of the mall are mostly food quarters and restaurants. There are still traces of evidence that survivors used to live here. You are sure that you can find essential resources here.

        "Time to start digging."
}

== travel_actions(->ret)
+ {canTravel(home)} [Go home.]
	With practiced steps, you follow the road back to the base.
	-> travel(home) ->
+ {canTravel(military_base)} [Go to the military base.]
	You start heading towards the entrance to San Tose, the military base.
	-> travel(military_base) ->
+ {canTravel(train_station)} [Go to the train station entrance.]
	You walk toward the train station.
	-> travel(train_station) ->
+ {canTravel(residential_district)} [Go to the residential district.]
	You travel to the residential district.
	-> travel(residential_district) ->
+ {canTravel(shopping_mall)} [Go to the shopping mall.]
	You take the main road to the shopping mall.
	-> travel(shopping_mall) ->
+ {canTravel(warehouse)} [Go to the warehouse.]
	You head inside one of the warehouses without making a sound.
	-> travel(warehouse) ->
+ {canTravel(underground)} [Go into the upper underground tunnels.]
	You delve into the tunnels underneath the military base.
	-> travel(underground) ->
+ {canTravel(underground_deep)} [Go into the lower underground tunnels.]
	With tentative steps, you venture further underground.
	-> travel(underground_deep) ->
+ {canTravel(train_station_inside)} [Go inside the train station.]
	You pass through the main doors of the train station.
	-> travel(train_station_inside) ->
+ {canTravel(train_station_upstairs)} [Go upstairs.]
	You climb the stairs to the upper levels.
	-> travel(train_station_upstairs) ->
+ {canTravel(1_story_house)} [Go to the one-story house.]
	You enter the one story house through an open window.
	-> travel(1_story_house) ->
+ {canTravel(2_story_house)} [Go to the two-story house.]
	The door to the two story house has broken down, so it is easy to enter.
	-> travel(2_story_house) ->
+ {canTravel(mall_left_wing)} [Go to the left wing.]
	You make your way to the left wing of the mall.
	-> travel(mall_left_wing) ->
+ {canTravel(mall_right_wing)} [Go to the right wing.]
	You go to the right wing of the mall.
	-> travel(mall_right_wing) ->
- ->ret