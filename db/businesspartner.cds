namespace app.businesspartner;

entity BusinessPartner {
    key ID               : Integer;
        company_title    : String;
        company_code     : String;
        balancesheet_qtr : Composition of many BalanceSheet_Qtr
                               on balancesheet_qtr.Company_header = $self;
}

entity BalanceSheet_Qtr {
    key Company_header          : Association to BusinessPartner;
    key ID                      : Integer;
    key endDate                 : Timestamp;
        maxAge                  : Integer64;
        cash                    : Integer64;
        shortTermInvestments    : Integer64; // *
        netReceivables          : Integer64; // *
        inventory               : Integer64; // *
        otherCurrentAssets      : Integer64;
        totalCurrentAssets      : Integer64; // *
        propertyPlantEquipment  : Integer64;
        goodWill                : Integer64; // *
        intangibleAssets        : Integer64;
        otherAssets             : Integer64;
        totalAssets             : Integer64; // *
        accountsPayable         : Integer64; // *
        shortLongTermDebt       : Integer64; // *
        otherCurrentLiab        : Integer64;
        longTermDebt            : Integer64; // *
        otherLiab               : Integer64;
        minorityInterest        : Integer64;
        totalCurrentLiabilities : Integer64; // *
        totalLiab               : Integer64; // *
        commonStock             : Integer64;
        retainedEarnings        : Integer64; // *
        treasuryStock           : Integer64;
        capitalSurplus          : Integer64;
        otherStockholderEquity  : Integer64;
        totalStockholderEquity  : Integer64;
        netTangibleAssets       : Integer64;
}
