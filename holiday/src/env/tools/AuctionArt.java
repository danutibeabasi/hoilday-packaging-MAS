package tools;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;

/**
 *      Artifact that implements the auction.
 */
public class AuctionArt extends Artifact {

    @OPERATION public void init(String taskDs, int maxPrice, String place)  {
        // observable properties
        defineObsProperty("task",          taskDs);
        defineObsProperty("maxPrice",      maxPrice);
        defineObsProperty("currentBid",    maxPrice);   // We put the current bid as maxPrice, so better bid < maxPrice
        defineObsProperty("currentWinner", "no_winner");
        defineObsProperty("currentReputation", 0.0);
        defineObsProperty("currentPlace", place);
        defineObsProperty("currentActivity", "nothing");
        System.out.println("Auction Artifact for "+taskDs+" maxPrice="+maxPrice+" has been initialized");
    }

    @OPERATION public void bid(double bidPrice, double reputation, String place, String activity) {
        ObsProperty opCurrentBid  = getObsProperty("currentBid");
        ObsProperty opCurrentWinner = getObsProperty("currentWinner");
        ObsProperty opCurrentRep = getObsProperty("currentReputation");
        ObsProperty opCurrentPlace = getObsProperty("currentPlace");
        ObsProperty opCurrentActivity = getObsProperty("currentActivity");

        if (opCurrentPlace.getValue().toString().equals(place) 
        && (bidPrice < opCurrentBid.doubleValue() || (opCurrentBid.doubleValue() == bidPrice && opCurrentRep.doubleValue() < reputation))) {
            // the bid is cheaper than the previous or, if equal, have better reputation
            opCurrentBid.updateValue(bidPrice);
            opCurrentWinner.updateValue(getCurrentOpAgentId().getAgentName());
            opCurrentRep.updateValue(reputation);
            opCurrentActivity.updateValue(activity);
        }
    }

}

