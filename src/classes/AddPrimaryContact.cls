public class AddPrimaryContact implements Queueable {

    private Contact Con;
    private String State;

    public AddPrimaryContact (Contact c, String s) {
        this.Con = c;
        this.State = s;
    }
    
    public void execute(QueueableContext context) {
        Contact tmp = new Contact();
        List<Contact> conlist = new List<Contact>();
        for (Account accts : [SELECT Id FROM Account WHERE BillingState = :State LIMIT 200]) {
            tmp = Con.Clone();
            tmp.AccountId = accts.Id;
            conlist.add(tmp);
        }
        insert conlist;
        System.debug(conlist);
    }

}