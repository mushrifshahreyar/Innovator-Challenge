namespace app.businesspartner;

entity BusinessPartner {
    key ID               : Integer;
        company_title    : String;
        company_code     : String;
        balancesheet_qtr : Composition of many BalanceSheet_Qtr
                               on balancesheet_qtr.Company_header = $self;
        cashflowstatements_qtr : Composition of many CashflowStatements_Qtr
                               on cashflowstatements_qtr.Company_header = $self;
}

entity BalanceSheet_Qtr {
    key Company_header          : Association to BusinessPartner;
    key ID                      : Integer;
    key endDate                 : Timestamp;
        maxAge                  : Integer;
        cash                    : Integer64;
        shortTermInvestments    : Integer; // *
        netReceivables          : Integer64; // *
        inventory               : Integer64; // *
        otherCurrentAssets      : Integer;
        totalCurrentAssets      : Integer64; // *
        propertyPlantEquipment  : Integer64;
        goodWill                : Integer; // *
        intangibleAssets        : Integer;
        otherAssets             : Integer64;
        totalAssets             : Integer64; // *
        accountsPayable         : Integer64; // *
        shortLongTermDebt       : Integer; // *
        otherCurrentLiab        : Integer64;
        longTermDebt            : Integer64; // *
        otherLiab               : Integer64;
        minorityInterest        : Integer;
        totalCurrentLiabilities : Integer64; // *
        totalLiab               : Integer64; // *
        commonStock             : Integer;
        retainedEarnings        : Integer64; // *
        treasuryStock           : Integer;
        capitalSurplus          : Integer64;
        otherStockholderEquity  : Integer;
        totalStockholderEquity  : Integer64;
        netTangibleAssets       : Integer64;
}

entity CashflowStatements_Qtr {
    key Company_header                          : Association to BusinessPartner;
    key ID                                      : Integer;
    key endDate                                 : Timestamp;
        maxAge                                  : Integer;
        netIncome                               : Integer;
        depreciation                            : Integer; // *
        changeToNetincome                       : Integer; // *
        changeToAccountReceivables              : Integer; // *
        changeToLiabilities                     : Integer;
        changeToInventory                       : Integer; // *
        changeToOperatingActivities             : Integer;
        totalCashFromOperatingActivities        : Integer; // *
        capitalExpenditures                     : Integer;
        investments                             : Integer;
        totalCashflowsFromInvestingActivities   : Integer; // *
        netBorrowings                           : Integer; // *
        otherCashflowsFromFinancingActivities   : Integer; // *
        totalCashFromFinancingActivities        : Integer;
        effectOfExchangeRate                    : Integer; // *
        changeInCash                            : Integer;
        issuanceOfStock                         : Integer;
}
