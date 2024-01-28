/*
    Service Company Agent
    ---------------------
    Accommodation A

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common accommodation service provider behaviors for this SCA
{ include("sca_accommodation_common.asl") }

/* Initial beliefs and rules */
my_name("Ibis").
my_task("accommodation").
my_reputation(4.0).

my_package("Saint-Étienne", "Novotel", 50).
my_package("London", "Charlie's Inn", 150).
my_package("Paris", "Hilton", 300).
my_package("Rio", "La mar", 50).
my_package("Lagos", "Radisson", 70).

/* Initial goals */

/* Plans */