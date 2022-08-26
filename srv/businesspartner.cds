using {app.businesspartner as businesspartner} from '../db/businesspartner';

service BusinessPartnerService {
    entity BusinessPartner        as projection on businesspartner.BusinessPartner actions {
        action CalcFinancialRatios();
        action PredictIncome();
    };
    entity BalanceSheet_Qtr       as projection on businesspartner.BalanceSheet_Qtr;
    entity CashflowStatements_Qtr as projection on businesspartner.CashflowStatements_Qtr;
    entity IncomeStatements_Qtr   as projection on businesspartner.IncomeStatements_Qtr;
    entity FinancialRatios_Qtr    as projection on businesspartner.FinancialRatios_Qtr;
    entity IncomeStmnt_Predicted  as projection on businesspartner.IncomeStmnt_Predicted;
    entity Prediction_Rule        as projection on businesspartner.Prediction_Rule;
    action UpdateBalanceSheet();
    
}
