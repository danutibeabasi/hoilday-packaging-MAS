// Organizational Goals for Contracting Phase
+!contracting_phase_completed
   <- !negotiateWithServiceProviders;
      !arrangeAccommodation;
      !arrangeTransport;
      !arrangeTourGuide.

// Organizational Goals for Purchasing Phase
+!purchasing_phase_completed
   <- !selectAndBookHolidayPackage.

// Organizational Goals for Delivering Phase
+!delivering_phase_completed
   <- !coordinateServiceDelivery;
      !provideAccommodation;
      !provideTransport;
      !conductTour.

// Additional Organizational Goals for Consumer Agent
+!holiday_package_enjoyed [consumer_agent]
   <- !enjoyHoliday.

// Additional Organizational Goals for Tour Operator Agent
+!package_supervised [tour_operator_agent]
   <- !supervisePackageDelivery.

+!feedback_collected [tour_operator_agent]
   <- !collectFeedback.
