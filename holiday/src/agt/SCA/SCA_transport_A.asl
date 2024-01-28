/*
    Service Company Agent
    ---------------------
    Transport A
    
    External Desc: Reputation, Name, Task, Package = [Origin, Destination, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_transport_common.asl") }

// Initial beliefs and rules
my_name("Saint-Etienne Airways").
my_task("transport").
my_reputation(4.3).

my_package("Saint-Etienne", "Paris", 100).
my_package("Paris", "Athens", 200).
my_package("Athens", "Moscow", 500).
my_package("Moscow", "New York", 1000).
my_package("New York", "Bangkok", 1200).

// Initial goals

// Plans