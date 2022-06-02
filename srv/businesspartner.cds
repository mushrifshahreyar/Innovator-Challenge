using { app.businesspartner as businesspartner } from '../db/businesspartner';

service BusinessPartnerService {
 entity BusinessPartner
	as projection on businesspartner.BusinessPartner;

 entity BalanceSheet_Qtr
	as projection on  businesspartner.BalanceSheet_Qtr;

 action test ();
}

annotate BusinessPartnerService.BusinessPartner with @(
    UI: {
        SelectionFields  : [ ID , company_code , company_title ],
        LineItem  : [
            {Value: ID},
            {Value: company_title, Label: 'Company Title'},
            {Value: company_code , Label: 'Company Code'},
        ],
    }
);
