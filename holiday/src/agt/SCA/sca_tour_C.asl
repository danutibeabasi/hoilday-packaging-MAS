/*
    Service Company Agent
    ---------------------
    Tour C

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_tour_common.asl") }

/* Initial beliefs and rules */

my_name("").
my_task("tour").
my_reputation(4.0).

my_package("Saint-Étienne", "La Cité du Design", 50).
my_package("Tokyo", "Shibuya", 150).
my_package("Bangkok", "Haipai Market", 300).
my_package("New Delhi", "Taj Mahal", 50).
my_package("Lagos", "Lekki Conservation Center", 70).

/* Initial goals */

/* Plans */