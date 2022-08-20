//this file contains code for locations

VAR travelBlocked = false //might be useful

LIST allLocations = home, location1, location2
VAR currentLocation = home

//here we list where is connected to where, it's basically the map
VAR connectedToHome = (location1, location2)
VAR connectedToLocation1 = (home, location2)
VAR connectedToLocation2 = (home)

//test if locations are connected to other locations here
== function canTravel(location)
{travelBlocked: 
    ~return false
}
{ currentLocation:
    -home:
        ~ return connectedToHome ? location
    -location1:
        ~ return connectedToLocation1 ? location
    -location2:
        ~ return connectedToLocation2 ? location
}

//adds an hour onto the time and changes the location
== travel(location)
-> passTime(1) ->
~ currentLocation = location
->->

// here you can put a description of the current location
== function describeCurrentLocation()
{ currentLocation:
	- home:
		This is a description of home.
	- location1:
		This is a description of location 1.
	- location2:
		This is a description of location 2.
}

== travel_actions(->ret)
+ {canTravel(home)} [Go home.]
	you go home
	-> travel(home) ->
+ {canTravel(location1)} [Go to location1.]
	you go to location 1
	-> travel(location1) ->
+ {canTravel(location2)} [Go to location2.]
	you go to location 2
    -> travel(location2) ->
- ->ret