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
