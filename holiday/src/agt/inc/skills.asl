// Actions for Tour Operator Agent (TOA)
+!negotiateWithServiceProviders
   <- performNegotiation. // Specific action for negotiation with service providers

+!arrangeAccommodation
   <- findAccommodationProviders. // Action for finding accommodation providers

+!arrangeTransport
   <- findTransportProviders. // Action for finding transport providers

+!arrangeTourGuide
   <- findTourGuides. // Action for finding tour guides

// Actions for Consumer Agent (CA)
+!selectAndBookHolidayPackage
   <- choosePackage; bookPackage. // Actions for choosing and booking a holiday package

// Actions for Services Company Agent (SCA)
+!coordinateServiceDelivery
   <- organizeServiceSchedule. // Action for organizing the schedule of services

+!provideAccommodation
   <- setupAccommodation. // Action for setting up accommodation

+!provideTransport
   <- arrangeTransportation. // Action for arranging transportation

+!conductTour
   <- leadTour. // Action for leading a tour

// Consumer Agent Enjoyment Actions
+!enjoyHoliday [consumer_agent]
   <- participateInActivities. // Action for participating in holiday activities

// Tour Operator Agent Supervision and Feedback Actions
+!supervisePackageDelivery [tour_operator_agent]
   <- overseeServices. // Action for overseeing the delivery of services

+!collectFeedback [tour_operator_agent]
   <- gatherConsumerFeedback. // Action for gathering feedback from consumers
