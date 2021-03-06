// Written by David Habib, copyright (c) 2009-2013 DJH Consulting, djhconsulting.com 
// This program is released under the GNU Affero General Public License, Version 3. http://www.gnu.org/licenses/

public with sharing class AUC_AuctionConstants { 
	
	// Various RecordTypes
	public static final string RECORDTYPE_CAMPAIGN_Auction = 'GW_Auction_Campaign';
	public static final string RECORDTYPE_OPP_AuctionDonatedItem = 'GW_Auction_Donated_Item';
	public static final string RECORDTYPE_OPP_AuctionPurchasedItem = 'GW_Auction_Purchased_Item';
	public static final string RECORDTYPE_OPP_AuctionTicket = 'GW_Auction_Ticket';
	public static final string RECORDTYPE_OPP_AuctionAttendee = 'GW_Auction_Attendee';

	// The four Types of Campaigns automatically created for each Auction
	public static final string CAMPAIGN_TYPE_AuctionAttendees = 'Auction Attendees';
	public static final string CAMPAIGN_TYPE_AuctionTickets = 'Auction Tickets';
	public static final string CAMPAIGN_TYPE_AuctionSponsors = 'Auction Sponsors';
	public static final string CAMPAIGN_TYPE_AuctionItemDonors = 'Auction Item Donors';
	
	// The Suffixes used for the Campaign Names created for Auctions.
	public static final string CAMPAIGN_NAME_SUFFIX_AuctionAttendees = ' Attendees';
	public static final string CAMPAIGN_NAME_SUFFIX_AuctionTickets = ' Tickets';
	public static final string CAMPAIGN_NAME_SUFFIX_AuctionSponsors = ' Sponsors';
	public static final string CAMPAIGN_NAME_SUFFIX_AuctionItemDonors = ' Item Donors';
	
	// The Suffixes used for the Opportunity Names created for Items, Tickets, etc.
	public static final string OPP_NAME_SUFFIX_AuctionDonatedItem = ' Auction Donated Item';
	public static final string OPP_NAME_SUFFIX_AuctionTicket = ' Auction Ticket';
	public static final string OPP_NAME_SUFFIX_AuctionPurchasedItem  = ' Auction Purchased Item';
	public static final string OPP_NAME_SUFFIX_AuctionGift  = ' Auction Gift';
	
	// the Opportunity Record Type to use for gifts/donations.
	public static string RECORDTYPE_OPP_AuctionGift { 
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return AUC_AuctionConstants.RECORDTYPE_OPP_AuctionPurchasedItem;
			return settings[0].Opportunity_Record_Type_Gift__c;
		}
	}

	// Opportunity Contact Roles that will be used for tickets, donated items, purchases, etc.
	public static string OPP_GIFT_DONOR_ROLE {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 'Individual Donor';
			return settings[0].Opportunity_Gift_Donor_Role__c;
		}
	}
	
	public static string OPP_ORG_GIFT_DONOR_ROLE {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 'Organizational Donor';
			return settings[0].Opportunity_Gift_Org_Donor_Role__c;
		}
	}
	
	// The Opportunity Stage to set for new auction item purchases.
	public static string OPP_STAGE_WON_NOT_THANKED_STAGE {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 'Closed Won - Not Thanked';
			return settings[0].Opportunity_Stage_Won_Not_Thanked__c;
		}
	}
	
	public static string OPP_STAGE_PLEDGED {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 'Pledged';
			return settings[0].Opportunity_Stage_Pledged__c;
		}
	}

	// The default Status to set for the Auction's auto-created Campaigns.
	public static string CAMPAIGN_Status_Default {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 'In Progress';
			return settings[0].Campaign_Status_Default__c;
		}
	}
		
	// how many rows to show in the Auction Ticket Purchases grid
	public static integer CROWS_PURCHASE_GRID {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 15;
			double db = settings[0].Number_of_Purchase_Grid_Rows__c;
			return db.intValue();
		}
	}

	// how many records to show per page on Auction Tabs
	public static integer cRecordsPerPage {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 25;
			double db = settings[0].Number_of_Records_Per_Page__c;
			if (db == 0 || db == null) return 25;
			return db.intValue();
		}
	}

	// whether to allow duplicate Bid Numbers per Auction, or not.
	public static boolean fAllowDuplicateBidNumbers {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return false;
			return settings[0].Allow_Duplicate_Bid_Numbers__c;
		}
	}
	
	// Get the user's Auction Receipts Intro text.
	public static string StrAuctionReceiptsIntro() {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				string str;
				if (settings[0].Auction_Receipts_Intro_1__c != null) str = settings[0].Auction_Receipts_Intro_1__c;
				if (settings[0].Auction_Receipts_Intro_2__c != null) str = str + ' ' + settings[0].Auction_Receipts_Intro_2__c;
				if (str != null) return str;
			}				
			return 'Please see the Auctions for Salesforce User\'s Guide to see how to set the Introductory text for Auction Receipts.';
	} 

	// Get the user's Auction Receipts Footer text.
	public static string StrAuctionReceiptsFooter() {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				string str;
				if (settings[0].Auction_Receipts_Footer_1__c != null) str = settings[0].Auction_Receipts_Footer_1__c;
				if (settings[0].Auction_Receipts_Footer_2__c != null) str = str + ' ' + settings[0].Auction_Receipts_Footer_2__c;
				if (str != null) return str;
			}				
			return 'Please see the Auctions for Salesforce User\'s Guide to see how to set the Footer text for Auction Receipts.';
	} 
	
	// read the custom setting and return the string for the Credit Card Validate URL formula for the CheckIn page.
	public static string StrCreditCardValidateURLFormula() {
		list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
		if (settings.size() > 0) {
			return settings[0].CreditCardValidateURLFormula__c;
		} else {
			return null;
		}
	}

	// read the custom setting and return the string for the Credit Card Charge URL formula for the CheckOut page.
	public static string StrCreditCardChargeURLFormula() {
		list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
		if (settings.size() > 0) {
			return settings[0].CreditCardChargeURLFormula__c;
		} else {
			return null;
		}
	}
		
	// read the custom setting and return the string for the Auction Receipts URL formula for the CheckOut page.
	// I was unable to get this working with Conga, so it is not used.
	public static string StrCheckOutReceiptsURLFormula() {	
		//list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
		//if (settings.size() > 0) {
		//	return settings[0].Check_Out_Receipts_URL__c;
		//} else {
			return null;
		//}
	}
		
	// read the custom setting and return the string for the window.open() parameters
	// when opening the Payment Processor Virtual Terminal.
	public static string StrPaymentProcessorWindowParameters() {
		list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
		if (settings.size() > 0) {
			return settings[0].Payment_Processor_Window_Parameters__c;
		} else {
			return 'menubar=0,status=0,toolbar=0,width=700,height=600';
		}
	}

	// read the custom setting and return the string for the iframe height
	// when opening the Payment Processor Virtual Terminal on our Auction pages.
	public static string StrPaymentProcessorPageHeight() {
		list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
		if (settings.size() > 0) {
			return settings[0].Payment_Processor_Page_Height__c;
		} else {
			return '300px';
		}
	}

	// whether to display the payment processor's virtual terminal on our page, or in a new browser window.
	public static boolean fShowPaymentProcessorOnPage {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return false;
			return settings[0].Show_Payment_Processor_On_Page__c;
		}
	}
	
	// the developer field name of an optional Opportunity Payment Method field
	// that Check Out will save into.
	public static string strOppPaymentMethodField {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return null;
			return settings[0].Opportunity_Payment_Method_Field__c;
		}
	}
	
	// the developer field name of an optional Opportunity Check Number field
	// that Check Out will save into.
	public static string strOppCheckNumberField {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return null;
			return settings[0].Opportunity_Check_Number_Field__c;
		}
	}	

	// whether to set the Account field on new opportunities
	public static boolean fSetAccountOnNewAuctionOpps {
		get {
			boolean fSetAccount = false;
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				fSetAccount = settings[0].Set_Account_On_New_Opportunities__c;
			}
			
			// even if the setting is off, still do this for NPSP 1:1 model
			return (fSetAccount || AUC_AuctionConstants.isOneToOne); 
		}
	}
	
	// developer name of a lookup field on Contact that points to Households
	public static string strContactHouseholdField {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				strContactHouseholdField = settings[0].Contact_Household_Field__c;
			}
			if (strContactHouseholdField == null && IsNPSPHHInstalled) {
				strContactHouseholdField = 'npo02__Household__c';	
			}
			return strContactHouseholdField;			
		}
		set;
	}
	
	// the developer path to the Name field on Households from Contact
	public static string strContactHouseholdNameField {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				strContactHouseholdNameField = settings[0].Contact_Household_Name_Field__c;
			}
			if (strContactHouseholdNameField == null && IsNPSPHHInstalled) {
				strContactHouseholdNameField = 'npo02__Household__r.Name';	
			}
			return strContactHouseholdNameField;			
		}
		set;
	}

	// the developer path to the Greeting field on Households from Contact
	public static string strContactHouseholdGreetingField {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() > 0) {
				strContactHouseholdGreetingField = settings[0].Contact_Household_Greeting_Field__c;
			}
			if (strContactHouseholdGreetingField == null && IsNPSPHHInstalled) {
				strContactHouseholdGreetingField = 'npo02__Household__r.npo02__Informal_Greeting__c';	
			}
			return strContactHouseholdGreetingField;			
		}
		set;
	}

	// maximum number of new Auction Item rows to show in the Donated Item Converter.
	public static integer cDonatedItemConverterBatchSize {
		get {
			list<AuctionSettings__c> settings = AuctionSettings__c.getall().values();
			if (settings.size() == 0) return 25;
			double db = settings[0].Donated_Item_Converter_Batch_Size__c;
			if (db == 0 || db == null) return 25;
			return db.intValue();
		}
	}


	//From the Non Profit Starter Pack.
	//One-to-One value for system processor field 	
	private static String ONE_TO_ONE_PROCESSOR = 'One-to-One'; 

	//From the Non Profit Starter Pack.
	//method to tell which model we're currently in for Accounts     
	private static boolean fCheckedForOneToOne = false; 
    private static boolean isOneToOne { 
    	get {
			// Kevin Bromer says: The npe01__Account_Processor__c field in the npe01__Contacts_And_Orgs_Settings__c 
			// setting will either be “One-to-One” or “Individual”  
			if (!fCheckedForOneToOne) { 
				if (IsNPSPInstalled) {
					string strSoql = 'Select Id, Name, npe01__Account_Processor__c From npe01__Contacts_And_Orgs_Settings__c';
					list<SObject> listSObj = database.query(strSoql);
					if (listSObj != null && listSObj.size() > 0) {
						string strModel = string.valueOf(listSObj[0].get('npe01__Account_Processor__c'));
						isOneToOne = (strModel == 'One-to-One');	
					} else {
						isOneToOne = false;
					}
				} else {
					isOneToOne = false;
				}
			fCheckedForOneToOne = true;
			}
			return isOneToOne;
	    }
    	set;
    } 	

    	/*** Kevin Bromer told me in Julyu 2012 that while this code will work, the 
    	correct way to detect one-to-one is to look at custom settings (which I now
    	do below.    	    	
    	boolean isOneToOneModel;     	
    	isOneToOneModel = false;   
    	Map<String, Schema.SObjectField> M = Schema.SObjectType.Contact.fields.getMap();
    	Schema.SObjectField fld = M.get('npe01__SystemAccountProcessor__c');
    	if (fld == null) return false;  	
    	//Schema.DescribeFieldResult F = Schema.sObjectType.Contact.fields.npe01__SystemAccountProcessor__c;
    	Schema.DescribeFieldResult F = fld.getDescribe();  
    	List<Schema.PicklistEntry> P = F.getPicklistValues(); 		
    	for(Schema.PicklistEntry pe : P){ 			
    		if (pe.isDefaultValue()){ 				
    			if(pe.getValue()==ONE_TO_ONE_PROCESSOR){ isOneToOneModel = true;} 			
    		} 		
    	} 		     	
    	return isOneToOneModel;  
    	*****/

	// public property to tell Auctions whether NPSP package is installed.
	private static boolean fCheckedForNPSP = false;
	public static boolean IsNPSPInstalled {
		get {
			if (!fCheckedForNPSP) {
				Schema.SObjectType token = Schema.getGlobalDescribe().get('npe01__Contacts_And_Orgs_Settings__c');
				IsNPSPInstalled = (token != null);
				fCheckedForNPSP = true;
			}
			return IsNPSPInstalled;
		}
		set;
	}
    
	// in order to avoid duplicate contact roles being created by us and the NPSP,
	// we have to be smart about when to do it.
	// In older versions of the NPSP (Households version < 2.0), one could prevent NPSP from 
	// creating contact roles on specific Opportunity record types.  Thus Auctions' installation guide instructs 
	// NPSP users to set each auction record type's _SYSTEM: HOUSEHOLD CONTACT ROLEPROCESSOR field to have a default value of "No Opportunities".  
	// Unfortunately, when NPSP moved to using custom settings to control its behavior, 
	// they only look at Household Settings - Household Contact Roles On, and they no longer support controlling this 
	// behavior by Opportunity record type.	
	//
	// According to Kevin Bromer on 3/8/2011:
	// In a 1x1 setup, the NPSP uses a before trigger on opps to populate the Contact_Id_for_Role__c from the associated 1x1 account. 
	// In a bucket account model, the NPSP relies on the baked in SFDC contact role creation (basically, only supporting URL param passing), 
	// then rolls through in an after-update to update role types if necessary.
	// 
	// Given this description, the fix is if Auctions detects 1:1 model, don't set a contact role, but set the account.  
	// If not a 1:1 model, go ahead and create the contact role.
    // public static boolean fCreateOppContactRoles() { 
	//    	return !isOneToOne();    	
    // }
	// At some point, I found this rule not good enough for all environments (Common Ground?  newer NPSP?  other?)
	// and so we just check for an OCR after the opp is saved, and if we don't find it, tell Auctions to create one.
    public static boolean fCreateOppContactRoles(ID oppId, ID contactId) {
    	if (oppId == null || contactId == null) return false;
    	OpportunityContactRole[] listOCR = [select Id from OpportunityContactRole where contactId=:contactId and OpportunityId=:oppId and IsPrimary=true]; 
    	return (listOCR.size() == 0);    	
    }
    
	// public property to tell Auctions whether NPSP Householding package is installed.
	private static boolean fCheckedForNPSPHH = false;
	public static boolean IsNPSPHHInstalled {
		get {
			if (!fCheckedForNPSPHH) {
				Schema.SObjectType token = Schema.getGlobalDescribe().get('npo02__Household__c');
				IsNPSPHHInstalled = (token != null);
				fCheckedForNPSPHH = true;
			}
			return IsNPSPHHInstalled;
		}
		set;
	}
    
    // method accepts the ID of any object type and returns the full name, including prefix of the sObject
	//type to which it belongs.
    public static Schema.SObjectType getObjectTypeFromId(ID sobjId) {

    	if (sobjId == null)
    		return null;
        string id = sobjId;
    	
    	// optimize hack!
    	// we know the Salesforce standard prefixes!
    	if (id.startsWith('003')) return Contact.sObjectType;
    	if (id.startsWith('001')) return Account.sObjectType;
    	
    	// for others, we'll do the work! 
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        string keyPrefix;

        for (Schema.SObjectType describe : gd.values()) {
    	    keyPrefix = describe.getDescribe().getKeyPrefix();
            if (keyPrefix != null && id.startsWith(keyPrefix)) {
        	    return describe;
            }
        }
        return null;
    }
            
	//==================== TEST METHOD(s) ======================================
	static testmethod void CodeCoverageTests() {
		System.Assert(AUC_AuctionConstants.RECORDTYPE_OPP_AuctionGift != null);
		System.Assert(AUC_AuctionConstants.OPP_GIFT_DONOR_ROLE != null);
		System.Assert(AUC_AuctionConstants.OPP_ORG_GIFT_DONOR_ROLE != null);
		System.Assert(AUC_AuctionConstants.OPP_STAGE_WON_NOT_THANKED_STAGE != null);
		System.Assert(AUC_AuctionConstants.OPP_STAGE_PLEDGED != null);
		System.Assert(AUC_AuctionConstants.CAMPAIGN_Status_Default != null);
		System.Assert(AUC_AuctionConstants.CROWS_PURCHASE_GRID != null);
		System.Assert(AUC_AuctionConstants.isOneToOne == false || AUC_AuctionConstants.isOneToOne == true);
		System.Assert(AUC_AuctionConstants.StrAuctionReceiptsIntro() != null);
		System.Assert(AUC_AuctionConstants.StrAuctionReceiptsFooter() != null);
		System.Assert(AUC_AuctionConstants.fCreateOppContactRoles(null, null) == false);
		System.Assert(AUC_AuctionConstants.getObjectTypeFromId(null) == null);
		AUC_AuctionConstants.StrCreditCardValidateURLFormula();
		AUC_AuctionConstants.StrCreditCardChargeURLFormula();
		system.assert(AUC_AuctionConstants.StrPaymentProcessorWindowParameters() != null);
		system.assert(AUC_AuctionConstants.StrPaymentProcessorPageHeight() != null);
		system.assert(AUC_AuctionConstants.fShowPaymentProcessorOnPage == AUC_AuctionConstants.fShowPaymentProcessorOnPage);
		system.assert(AUC_AuctionConstants.cRecordsPerPage > 0);
		system.assert(AUC_AuctionConstants.fAllowDuplicateBidNumbers == AUC_AuctionConstants.fAllowDuplicateBidNumbers);
	}
	
	static testmethod void TestNoSettings() {		
		// now delete the custom settings, and make sure we are still robust.
        //clear out whatever settings exist
        delete [select id from AuctionSettings__c];
		CodeCoverageTests();
	}
}