@isTest  
public class SF45_MaintenanceRequestsMock extends SPRD_MaintenanceRequests {
	public Boolean workOrdersWereUpdated {get; private set;}

    public SF45_MaintenanceRequestsMock(List<Case> maintenanceRequestList) {
    	super(maintenanceRequestList, new SDAO_GenericDmlMock(), new SF45_WorkPartSelectorMock(0));
    } 
	
	public override void updateWorkOrders(Map<Id,SObject> oldMaintenanceRequestMap) {
		this.workOrdersWereUpdated = true;
	}
}