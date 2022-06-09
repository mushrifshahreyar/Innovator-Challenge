using {app.businesspartner as businesspartner} from '../db/businesspartner';

service BusinessPartnerService {
    entity BusinessPartner  as projection on businesspartner.BusinessPartner;
    entity BalanceSheet_Qtr as projection on businesspartner.BalanceSheet_Qtr;
    action UpdateBalanceSheet();
}
