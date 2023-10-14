/**
 * @author eduardo.bisso
 */
trigger Account on Account (before insert
                          , before update
                          , after insert
                          , after update) {

    System.debug('Account trigger update');

}