/* Auxiliary rules for agents */

// Check if I placed the current best bid on auction artifact Art
i_am_winning(Art) 
    :-  currentWinner(W)[artifact_id(Art)]
        & .my_name(Me) 
        & .term2string(Me,MeS) 
        & W == MeS.

/* Auxiliary plans for Cartago */
!start.

+!start
   : my_task(Task)
   <- .concat("auction_for_",Task,Result);
      !discover_art(Result);
      .


// try to find a particular artifact and then focus on it
+!discover_art(ToolName)
   <- lookupArtifact(ToolName,ToolId);
      focus(ToolId);
      !open_bid(ToolId).
// keep trying until the artifact is found
-!discover_art(ToolName)
   <- .wait(100);
      !discover_art(ToolName).
