/*
    Service Company Agent
    ---------------------
    Accommodation C

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common accommodation service provider behaviors for this SCA
{ include("sca_accommodation_common.asl") }

/* Initial beliefs and rules */

my_name("Hilton Group").
my_task("accommodation").
my_reputation(4.0).

my_package("Rio", "Pessoa Hotel", 70).
my_package("Paris", "Le Carlton ", 150).
my_package("Saint-Étienne", "Les Halles", 30).
my_package("Athens", "Heraklion", 70).
my_package("Berlin", "Viel Glück Hotel", 70).

/* Initial goals */

/* Plans */