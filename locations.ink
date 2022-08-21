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
        home
	-military_base:
        military
    -train_station:
        train
    -residential_district:
        residential
    -shopping_mall:
       mall
    -warehouse:
        warehouse
    -underground:
        underground
    -underground_deep:
        deep
    -train_station_inside:
        inside
    -train_station_upstairs:
        upstairs
    -1_story_house:
        1 story
    -2_story_house:
        2 story
    -mall_left_wing:
        left
    -mall_right_wing:
        right
}

== travel_actions(->ret)
+ {canTravel(home)} [Go home.]
	you go home
	-> travel(home) ->
+ {canTravel(military_base)} [Go to the military base.]
	mil
	-> travel(military_base) ->
+ {canTravel(train_station)} [Go to the train station.]
	trai
	-> travel(train_station) ->
+ {canTravel(residential_district)} [Go to the residential district.]
	reside
	-> travel(residential_district) ->
+ {canTravel(shopping_mall)} [Go to the shopping mall.]
	shopp
	-> travel(shopping_mall) ->
+ {canTravel(warehouse)} [Go to the warehouse.]
	ware
	-> travel(warehouse) ->
+ {canTravel(underground)} [Go into the upper underground tunnels.]
	under
	-> travel(underground) ->
+ {canTravel(underground_deep)} [Go into the lower underground tunnels.]
	deep
	-> travel(underground_deep) ->
+ {canTravel(train_station_inside)} [Go inside the train station.]
	insid
	-> travel(train_station_inside) ->
+ {canTravel(train_station_upstairs)} [Go upstairs.]
	upsta
	-> travel(train_station_upstairs) ->
+ {canTravel(1_story_house)} [Go to the one-story house.]
	1 sto
	-> travel(1_story_house) ->
+ {canTravel(2_story_house)} [Go to the two-story house.]
	2 stor
	-> travel(2_story_house) ->
+ {canTravel(mall_left_wing)} [Go to the left wing.]
	left wing
	-> travel(mall_left_wing) ->
+ {canTravel(mall_right_wing)} [Go to the right wing.]
	right wing
	-> travel(mall_right_wing) ->
- ->ret