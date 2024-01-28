/*
    Service Company Agent
    ---------------------
    Transport C

    External Desc: Reputation, Name, Task, Package = [Origin, Destination, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_transport_common.asl") }

// Initial beliefs and rules
my_name("Easy Jet Saint-Etienne").
my_task("transport").
my_reputation(3.9).

my_package("Saint-Etienne", "Paris", 200).
my_package("Paris", "Athens", 400).
my_package("Athens", "Moscow", 450).
my_package("Moscow", "New York", 900).
my_package("New York", "Bangkok", 1000).

// Initial goals

// Plans