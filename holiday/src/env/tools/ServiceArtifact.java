package tools;

import cartago.*;

public class ServiceArtifact extends Artifact {

    private boolean isAvailable;
    private String serviceType;
    private String place;
    private int price;

    void init(String service, String place, int price) {
        this.serviceType = service;
        this.place = place;
        this.price = price;
        this.isAvailable = true;
    }

    @OPERATION
    void executeService(OpFeedbackParam<Boolean> result) {
        if (isAvailable) {
            isAvailable = false;

            log("Service executed: " + serviceType + " at " + place + " for the price of " + price);

        
            int resetTime = determineResetTime(serviceType);
            this.execInternalOp("resetAvailability", resetTime);

            result.set(true); // Indicate successful execution
        } else {
            result.set(false); // Indicate that the service is not available
        }
    }

    @INTERNAL_OPERATION
    void resetAvailability(Object[] args) {
        int waitTime = (int) args[0];
        await_time(waitTime);
        isAvailable = true;
        log("Service availability reset: " + serviceType + " at " + place);
    }

    private int determineResetTime(String serviceType) {
        switch (serviceType) {
            case "accommodation":
                return 24 * 60 * 60 * 1000; // 24 hours in milliseconds
            case "transport":
                return 12 * 60 * 60 * 1000; // 12 hours
            
            default:
                return 60 * 60 * 1000; 
        }
    }


    @OPERATION
    void checkAvailability(OpFeedbackParam<Boolean> result) {
        result.set(isAvailable);
    }

    @OPERATION
    void resetAvailability() {
        isAvailable = true;
    }

    @OPERATION
    void contractService(String serviceType, String location, double price) {
        // Check if service is available before contracting
        if (isAvailable) {
            isAvailable = false;
            log("Service contracted: " + serviceType + " at " + location + " for the price of " + price);
            // Additional logic to record the contract details can be added here
        } else {
            failed("Service is not available for contracting");
        }
    }
}
