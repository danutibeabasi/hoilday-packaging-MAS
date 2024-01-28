/*
    Service Company Agent
    ---------------------
    Restauration C

    External Desc: Reputation, Name, Task, Package = [Place, RestaurantName, Price]
*/

// Inclusion of common restauration service provider behaviors for this SCA
{ include("sca_restauration_common.asl") }

/* Initial beliefs and rules */

my_name("GuttenEssen").
my_task("restauration").
my_reputation(4.9).

my_package("Saint-Étienne", "La Pillotière", 5).
my_package("Tokyo", "Nakagawa", 15).
my_package("Berlin", "Das mariner", 20).
my_package("New York", "The silver scale", 50).
my_package("Istanbul", "Adana's", 20).
my_package("Paris", "Le casse-croute", 20).


/* Initial goals */

/* Plans */