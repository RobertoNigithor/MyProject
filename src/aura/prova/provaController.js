/**
 * Created by RChinnici on 03/05/2023.
 */

({
    init: function(component, event, helper) {
        // Initialization code if needed
    },

    showAccountForm: function(component, event, helper) {
        component.set("v.showAccountForm", true);
    },

    showLeadForm: function(component, event, helper) {
        component.set("v.showAccountForm", false);
    },

    createAccount: function(component, event, helper) {
        var account = component.get("v.account");
        // Perform server-side action to create Account
        // ...
        // Fire event to indicate Account creation
        var accountCreatedEvent = component.getEvent("accountCreated");
        accountCreatedEvent.fire();
    },

    createLead: function(component, event, helper) {
        var lead = component.get("v.lead");
        // Perform server-side action to create Lead
        // ...
        // Fire event to indicate Lead creation
        var leadCreatedEvent = component.getEvent("leadCreated");
        leadCreatedEvent.fire();
    }
})