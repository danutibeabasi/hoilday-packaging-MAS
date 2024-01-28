/*
    Service Company Agent
    ---------------------
    Transport B

    External Desc: Reputation, Name, Task, Package = [Origin, Destination, Price]
*/

// Inclusion of common tour service provider behaviors for this SCA
{ include("sca_transport_common.asl") }

// Initial beliefs and rules
my_name("Air Saint-Etienne Jet").
my_task("transport").
my_reputation(4.9).

my_package("Saint-Etienne", "Paris", 50).
my_package("Paris", "Athens", 100).
my_package("Athens", "Moscow", 550).
my_package("Moscow", "New York", 1200).
my_package("New York", "Bangkok", 1400).

// Initial goals

// Plans