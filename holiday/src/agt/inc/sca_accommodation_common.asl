// Inclusion of standards agent's behavior to make agents able to work in an JaCaMo environment
{ include("$jacamoJar/templates/common-cartago.asl") }
// Inclusion of common behaviors for this SCA
{ include("common.asl") }


// When bid are open, focus on the auction and make bid
+!open_bid(ArtifactID) : not i_am_winning(ArtifactID)
    <-  ?my_task(Task);
        ?my_reputation(MyRep);
        for( my_package(Place, HotelName, MyPrice)) {
            .print("Bidding in auction for ", Place, " at ", HotelName, " with price: $", MyPrice);
            focus(ArtifactID);
            bid(MyPrice, MyRep, Place, HotelName);
        }.