/*
    Service Company Agent
    ---------------------
    Tour A

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_tour_common.asl") }

/* Initial beliefs and rules */

my_name("BigBus").
my_task("tour").
my_reputation(4.0).

my_package("Saint-Étienne", "La Cité du Design", 50).
my_package("Berlin", "Bundestag", 150).
my_package("Paris", "Tour Eiffel", 300).
my_package("Rio", "Christ The Redeemer", 50).
my_package("Lagos", "Abiola Statue", 70).

/* Initial goals */

/* Plans */