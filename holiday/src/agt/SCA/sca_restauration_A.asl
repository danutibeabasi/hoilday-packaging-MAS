/*
    Service Company Agent
    ---------------------
    Restauration A

    External Desc: Reputation, Name, Task, Package = [Place, RestaurantName, Price]
*/

// Inclusion of common restauration service provider behaviors for this SCA
{ include("sca_restauration_common.asl") }

/* Initial beliefs and rules */

my_name("SuperFood").
my_task("restauration").
my_reputation(3.2).

my_package("Saint-Étienne", "Chez Martine", 25).
my_package("London", "Williamsburg", 15).
my_package("Paris", "L'Oranger", 20).
my_package("Berlin", "Bundeschnitzel", 50).
my_package("Tokyo", "Tanakachori", 20).


/* Initial goals */

/* Plans */