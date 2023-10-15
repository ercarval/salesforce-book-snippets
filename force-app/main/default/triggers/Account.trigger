/**
 * @author eduardo.bisso
 */
trigger Account on Account (before insert
                          , before update
                          , after insert) {
    
    new AccountTriggerHandler().run(); // LINDO!!! 
    

}