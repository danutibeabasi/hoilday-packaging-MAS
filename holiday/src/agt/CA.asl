/*
    Client Agent
    ------------
    External Description : TOAPreferences = [Budget, Place, TOAMinReputation]
*/

// Initial Beliefs and Rules
my_preference("budget",200).
my_preference("min_reputation",3.6).
my_preference("place","Paris").

// Initial Goals



// Plans

+begin_purchasing(Test)[source(Toa)] : Test = true
    <-  !query_holiday_packages(Toa).

// Asking TOA for available holiday packages
+!query_holiday_packages(Toa)
    <-  .send(Toa, askOne, get_holiday_package_info).

// Triggered after query_holiday_packages
+available_packages(PackageName)[source(Toa)]
   <-   !get_holiday_package(PackageName,Contracts);
        // !select_best_package(Contracts, SelectedPackage);
        .print("Package details: ",Contracts);
        !purchase_holiday_package(PackageName,Toa).

+!get_holiday_package(PackageName,Contracts)
   <-   lookupArtifact("holidayPackageLibrary", OrgLibId);
        focus(OrgLibId);
        .print("Looking for ",PackageName," details in holidayPackageLibrary");
        getHolidayPackage(PackageName, Contracts);
        .

// +!select_best_package(Contracts, SelectedPackage)
//     <- for(.member(Contract,Contracts)) {
//         .print(Contract);
//     }

// Purchasing the selected holiday package
+!purchase_holiday_package(SelectedPackage,Toa)
   <-  .send(Toa, achieve, purchase_package(SelectedPackage)).

+purchase_confirmed(PackageName)
    <-  .print("Successfully purchased the package", PackageName).

