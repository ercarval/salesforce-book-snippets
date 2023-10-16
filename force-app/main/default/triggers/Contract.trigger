/**
 * @author eduardo.bisso - dev-builder
 */
trigger Contract on Contract (after insert, after update) {

   new ContractTriggerHandler().run();

}