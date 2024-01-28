/*
    Service Company Agent
    ---------------------
    Tour B

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_tour_common.asl") }

/* Initial beliefs and rules */

my_name("Club Med").
my_task("tour").
my_reputation(4.0).

my_package("Athens", "Pantheon", 50).
my_package("New York", "Empire State Building", 150).
my_package("Paris", "Le Louvre", 300).
my_package("Moscow", "Christ The Redeemer", 50).
my_package("Lagos", "Abiola Statue", 70).

/* Initial goals */

/* Plans */