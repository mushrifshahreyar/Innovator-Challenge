namespace app.businesspartner;

entity BusinessPartner {
    key ID                     : Integer;
        company_title          : String;
        company_code           : String;
        balancesheet_qtr       : Composition of many BalanceSheet_Qtr
                                     on balancesheet_qtr.Company_header = $self;
        cashflowstatements_qtr : Composition of many CashflowStatements_Qtr
                                     on cashflowstatements_qtr.Company_header = $self;
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

entity CashflowStatements_Qtr {
    key Company_header                        : Association to BusinessPartner;
    key ID                                    : Integer;
    key endDate                               : Timestamp;
        maxAge                                : Integer64;
        netIncome                             : Integer64;
        depreciation                          : Integer64; // *
        changeToNetincome                     : Integer64; // *
        changeToAccountReceivables            : Integer64; // *
        changeToLiabilities                   : Integer64;
        changeToInventory                     : Integer64; // *
        changeToOperatingActivities           : Integer64;
        totalCashFromOperatingActivities      : Integer64; // *
        capitalExpenditures                   : Integer64;
        investments                           : Integer64;
        totalCashflowsFromInvestingActivities : Integer64; // *
        netBorrowings                         : Integer64; // *
        otherCashflowsFromFinancingActivities : Integer64; // *
        totalCashFromFinancingActivities      : Integer64;
        effectOfExchangeRate                  : Integer64; // *
        changeInCash                          : Integer64;
        issuanceOfStock                       : Integer64;
}

entity IncomeStatements_Qtr {
    key Company_header                    : Association to BusinessPartner;
    key ID                                : Integer;
    key endDate                           : Timestamp;
        maxAge                            : Integer64;
        totalRevenue                      : Integer64;
        costOfRevenue                     : Integer64;
        grossProfit                       : Integer64;
        researchDevelopment               : Integer64;
        sellingGeneralAdministrative      : Integer64;
        nonRecurring                      : Integer64;
        otherOperatingExpenses            : Integer64;
        totalOperatingExpenses            : Integer64;
        operatingIncome                   : Integer64;
        totalOtherIncomeExpenseNet        : Integer64;
        ebit                              : Integer64;
        interestExpense                   : Integer64;
        incomeBeforeTax                   : Integer64;
        incomeTaxExpense                  : Integer64;
        minorityInterest                  : Integer64;
        netIncomeFromContinuingOps        : Integer64;
        discontinuedOperations            : Integer64;
        extraordinaryItems                : Integer64;
        effectOfAccountingCharges         : Integer64;
        otherItems                        : Integer64;
        netIncome                         : Integer64;
        netIncomeApplicableToCommonShares : Integer64;
}
