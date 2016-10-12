trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> t = new List<Task>();
    for (Opportunity opps : [SELECT Id, Name From Opportunity 
    	WHERE Id IN :Trigger.New AND StageName = 'Closed Won']) {
    	t.add(new Task(WhatId = opps.Id, Subject = 'Follow Up Test Task'));
    }
    if (t.size() > 0) {
    	insert t;
    }
}