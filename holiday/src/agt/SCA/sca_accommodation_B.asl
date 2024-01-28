/*
    Service Company Agent
    ---------------------
    Accommodation B

    External Desc: Reputation, Name, Task, Package = [Place, HotelName, Price]
*/

// Inclusion of common accommodation service provider behaviors for this SCA
{ include("sca_accommodation_common.asl") }

/* Initial beliefs and rules */

my_name("Accor").
my_task("accommodation").
my_reputation(4.0).

my_package("Moscow", "Rossiya Hotel", 50).
my_package("Tokyo", "Kaisen Hotel", 150).
my_package("New York", "Hotel Square", 300).
my_package("Bangkok", "Phuket's Resort", 50).
my_package("New Delhi", "Bharat Center", 70).

/* Initial goals */

/* Plans */