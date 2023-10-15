/**
 * @author eduardo.bisso - dev-builder
 */
trigger Contract on Contract (after update) {

   new ContractTriggerHandler().run();

}