/*
    Tour Operator Agent
    ---------------------
    External description: Reputation, Name, SCAPreferences = [Service, Budget]
*/

// Inclusion of standards agent's behavior to make agents able to work in an JaCaMo environment
{ include("$jacamoJar/templates/common-cartago.asl") }

// Initial beliefs and rules
my_reputation(3.9).
my_name("Expedia").

hp_place("Paris").
sca_preference("transport",200).
sca_preference("accommodation",1000).
sca_preference("restauration",50).
sca_preference("tour",500).

// Initial goals
!start.

// Plans
+!start
    <-  
        !contract_holiday_package;
        !sell_holiday_package;
        .


/*  
    --------------
    CONTRACT PHASE
    --------------
*/

// Beginning of the contract phase
+!contract_holiday_package
    <-  println;
        .print("  $$$ CONTRACTING PHASE $$$");
        !create_auction_artifacts;
        !wait_for_bids;
        !contract_winners;
        !aggregate_contracts;
        // for (contract(ServiceTask, SCA, Price, Place, Reputation, Activity)) {
        //     !finalize_contract(ServiceTask, Place, Price, SCA) ;
        // }
        .

// Plan for creating all the artifacts for each task
+!create_auction_artifacts
    <-  for (sca_preference(Task, Budget) ) {  // iterate over the beliefs my_preference
            !create_auction_artifact(Task, Budget);
        };
        .

// Plan for creation of an auction artifact for a given task, maxprice, min_reputation -> returns ArtId
+!create_auction_artifact(Task,MaxPrice)
   <-   .concat("auction_for_",Task,ArtName);
        ?hp_place(Place);
        makeArtifact(ArtName, "tools.AuctionArt", [Task, MaxPrice, Place], ArtId);
        focus(ArtId).

// Recovery Plan for failure in the creation of an auction artifact for a given task and maxprice      
-!create_auction_artifact(Task,MaxPrice)[error_code(Code)]
   <-   .print("Error creating artifact ", Code).

// Plan for handling the bids and getting the winner of an auction
+!wait_for_bids
   <- println("Waiting bids for 5 seconds...\n");
      .wait(5000); // use an internal deadline of 5 seconds to close the auctions
      .

// Plan to retrieve winner of the Contracting Phase auction
+!contract_winners
   <-   println;
        .print("Winners of the contracting auction is:");
        for ( currentWinner(Ag)[artifact_id(ArtId)] ) {
            ?currentBid(Price)[artifact_id(ArtId)]; // check the current bid
            ?currentReputation(Rep)[artifact_id(ArtId)]; // check the current bid
            ?currentPlace(Place)[artifact_id(ArtId)];
            ?currentActivity(Activity)[artifact_id(ArtId)];
            ?task(Task)[artifact_id(ArtId)];          // and the task it is for
            !print_winner(Task, Ag, Price, Place, Rep, Activity);
            +contract(Task, Ag, Price, Place, Rep, Activity);
        }.

// Print Task winner correctly if there is one
+!print_winner(Task, Ag, Price, Place, Rep,Activity) : Ag = "no_winner"
    <-  .print("No winner for task ", Task).
+!print_winner(Task, Ag, Price, Place, Rep, Activity)
    <-  .print("Winner of task '", Task,"' is: ", Ag, " for ", Price, "$ with reputation graded ", Rep," at ",Place," to do ",Activity).


// Plan to aggregate contracts into a holiday package
+!aggregate_contracts
   <-  .findall(contract(ServiceTask, SCAName, Price, Place, Reputation, Activity), contract(ServiceTask, SCAName, Price, Place, Reputation, Activity), Contracts);
        println;
       .print("Aggregating contracts into a holiday package: ", Contracts);
       !create_holiday_package(Contracts).

// Plan to create a holiday package from the contracts
+!create_holiday_package(Contracts)
   <-   ?my_name(Name);
        .concat("HolidayPackage_", Name, PackageName);
        // Logic to create the holiday package organization with Contracts
        .print("Created holiday package: ", PackageName);
        +hp_name(PackageName);
        // Update the organization library
        !update_organization_library(PackageName, Contracts).

// Plan to update the organization library with the new holiday package
+!update_organization_library(PackageName, Contracts)
   <-   makeArtifact("holidayPackageLibrary", "tools.OrganizationLibArt", [], OrgLibId);
        focus(OrgLibId);
        .print("Updating organization library with package: ", PackageName);
        addHolidayPackage(PackageName, Contracts).

+!finalize_contract(Service, Place, Price, SCA) 
   <-  makeArtifact("serviceArtifact", "tools.ServiceArtifact", ArtId); // Find the ServiceArtifact
       .exec(ArtId, "contractService", Service, Place, Price); // Update the service availability
       -+contracted_service(Service, Place, Price, SCA); // Record the contracted service in TOA's beliefs
       .print("Contract finalized with ", SCA, " for ", Service, " in ", Place, " at price ", Price).

/*
    ----------------
    PURCHASING PHASE
    ----------------
*/

+!sell_holiday_package
    <-  println;
        .print("   $$$ PURCHASING PHASE $$$");
        .send(ca, tell, begin_purchasing(true)).

// Responding to CA query about holiday packages
+?get_holiday_package_info[source(Client)]
    <-  ?hp_name(PackageName);
        .print("Sending ",PackageName,"info to Client");
        .send(Client, tell, available_packages(PackageName)).

// Processing the purchase of a holiday package
+!purchase_package(PackageName)[source(Client)]
   <-  .print("Processing purchase of package ", PackageName, " by ", Client);
        // Here we can continue to add the rest of the logic
       .send(Client, tell, purchase_confirmed(PackageName)).
