/*
    Service Company Agent
    ---------------------
    Restauration B

    External Desc: Reputation, Name, Task, Package = [Place, RestaurantName, Price]
*/

// Inclusion of common restauration service provider behaviors for this SCA
{ include("sca_restauration_common.asl") }

/* Initial beliefs and rules */

my_name("MangerBouger").
my_task("restauration").
my_reputation(4).

my_package("Saint-Étienne", "La Rocamarie", 5).
my_package("Paris", "Le Fouquet's", 35).
my_package("Lagos", "Delicious Abacha", 15).
my_package("Athens", "Hexarchopoulos", 50).
my_package("Moscow", "Alexievitch", 20).


/* Initial goals */

/* Plans */