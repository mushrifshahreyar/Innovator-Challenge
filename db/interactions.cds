namespace app.interactions;
using {managed} from '@sap/cds/common';

entity Company: managed {
    key ID            : Integer;
        company_title : String;
        company_desc  : String;
        company_code  : String;
        cashflow_qtr  : Composition of many Cashflow_Qtr
                            on cashflow_qtr.Company_header = $self;
}

entity Cashflow_Qtr: managed {
    key Company_header          : Association to Company;
    key ID                      : Integer;
    key endDate                 : String;
        maxAge                  : Integer;
        cash                    : Integer;
        shortTermInvestments    : Integer; // *
        netReceivables          : Integer; // *
        inventory               : Integer; // *
        otherCurrentAssets      : Integer;
        totalCurrentAssets      : Integer; // *
        propertyPlantEquipment  : Integer;
        goodWill                : Integer; // *
        intangibleAssets        : Integer;
        otherAssets             : Integer;
        totalAssets             : Integer; // *
        accountsPayable         : Integer; // *
        shortLongTermDebt       : Integer; // *
        otherCurrentLiab        : Integer;
        longTermDebt            : Integer; // *
        otherLiab               : Integer;
        minorityInterest        : Integer;
        totalCurrentLiabilities : Integer; // *
        totalLiab               : Integer; // *
        commonStock             : Integer;
        retainedEarnings        : Integer; // *
        treasuryStock           : Integer;
        capitalSurplus          : Integer;
        otherStockholderEquity  : Integer;
        totalStockholderEquity  : Integer;
        netTangibleAssets       : Integer;
}
