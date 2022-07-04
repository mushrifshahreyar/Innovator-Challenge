using BusinessPartnerService as service from '../../srv/businesspartner';

annotate service.BusinessPartner with @(
    UI.LineItem        : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Company Title',
            Value : company_title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Company Code',
            Value : company_code,
        },
    ],
    UI.SelectionFields : [
        ID,
        company_code,
        company_title
    ],
);

annotate service.BusinessPartner with @(
    UI.HeaderInfo                  : {
        Title          : {
            $Type : 'UI.DataField',
            Label : 'Company Title',
            Value : company_title,
        },
        Description    : {
            $Type : 'UI.DataField',
            Label : 'Company Code',
            Value : company_code,
        },
        TypeName       : 'Business Partner',
        TypeNamePlural : 'Business Partners',
        ImageUrl       : 'https://i.pinimg.com/originals/03/32/88/033288573e174c88f2f3b3c789b75212.jpg',
    },

    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Company Title',
                Value : company_title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Company Code',
                Value : company_code,
            },
        ],
    },


    UI.HeaderFacets                : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'Company Details',
        Target : '@UI.FieldGroup#GeneratedGroup1'
    }],

    UI.Identification              : [{
        $Type             : 'UI.DataFieldForAction',
        Label             : 'Import Financial Data',
        Action            : 'BusinessPartnerService.EntityContainer/UpdateBalanceSheet',
        ![@UI.Importance] : #High
    }]

);

annotate service.BusinessPartner with @(UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Balance Sheet Quaterly',
    ID     : 'BalanceSheetQuaterly1',
    Target : 'balancesheet_qtr/@UI.LineItem#BalanceSheetQuaterly',
},
{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'CashFlow Statements Quaterly',
    ID     : 'CashflowStatementsQuaterly1',
    Target : 'cashflowstatements_qtr/@UI.LineItem#CashflowStatementsQuaterly',
},
{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Income Statements Quaterly',
    ID     : 'IncomeStatementsQuaterly1',
    Target : 'incomeStatements_Qtr/@UI.LineItem#IncomeStatementsQuaterly',
}
]);

annotate service.BalanceSheet_Qtr with @(UI.LineItem #BalanceSheetQuaterly : [
    {
        $Type : 'UI.DataField',
        Value : ID,
        Label : 'ID',
    },
    {
        $Type : 'UI.DataField',
        Value : shortTermInvestments,
        Label : 'Short Term Investment',
    },
    {
        $Type : 'UI.DataField',
        Value : netReceivables,
        Label : 'Net Receivables',
    },
    {
        $Type : 'UI.DataField',
        Value : inventory,
        Label : 'Inventory',
    },
    {
        $Type : 'UI.DataField',
        Value : totalCurrentAssets,
        Label : 'Total Current Assets',
    },
    {
        $Type : 'UI.DataField',
        Value : goodWill,
        Label : 'Good Will',
    },
    {
        $Type : 'UI.DataField',
        Value : totalAssets,
        Label : 'Total Assets',
    },
    {
        $Type : 'UI.DataField',
        Value : accountsPayable,
        Label : 'Accounts Payable',
    },
    {
        $Type : 'UI.DataField',
        Value : shortLongTermDebt,
        Label : 'Short Long Term Debt',
    },
    {
        $Type : 'UI.DataField',
        Value : longTermDebt,
        Label : 'Long Term Debt',
    },
    {
        $Type : 'UI.DataField',
        Value : totalCurrentLiabilities,
        Label : 'Total Current Liabilities',
    },
    {
        $Type : 'UI.DataField',
        Value : totalLiab,
        Label : 'Total Liab',
    },
    {
        $Type : 'UI.DataField',
        Value : retainedEarnings,
        Label : 'Retained Earnings',
    },

]);

annotate service.CashflowStatements_Qtr with @(UI.LineItem #CashflowStatementsQuaterly : [
    {
        $Type : 'UI.DataField',
        Value : ID,
        Label : 'ID',
    },
    {
        $Type : 'UI.DataField',
        Value : netIncome,
        Label : 'Net Income',
    },
    {
        $Type : 'UI.DataField',
        Value : depreciation,
        Label : 'Depreciation',
    },
    {
        $Type : 'UI.DataField',
        Value : changeToNetincome,
        Label : 'Change To NetIncome',
    },
    {
        $Type : 'UI.DataField',
        Value : changeToAccountReceivables,
        Label : 'Change To Account Receivables',
    },
    {
        $Type : 'UI.DataField',
        Value : changeToLiabilities,
        Label : 'Change To Liabilities',
    },
    {
        $Type : 'UI.DataField',
        Value : changeToInventory,
        Label : 'Change To Inventory',
    },
    {
        $Type : 'UI.DataField',
        Value : changeToOperatingActivities,
        Label : 'Change To Operating Activities',
    },
    {
        $Type : 'UI.DataField',
        Value : totalCashFromOperatingActivities,
        Label : 'Total Cash from Operating Activities',
    },
    {
        $Type : 'UI.DataField',
        Value : capitalExpenditures,
        Label : 'Capital Expentitures',
    },
    {
        $Type : 'UI.DataField',
        Value : investments,
        Label : 'Investments',
    },
    {
        $Type : 'UI.DataField',
        Value : totalCashflowsFromInvestingActivities,
        Label : 'Total Cash Flows From Investing Activities',
    },
    {
        $Type : 'UI.DataField',
        Value : netBorrowings,
        Label : 'Net Borrowings',
    },
    {
        $Type : 'UI.DataField',
        Value : otherCashflowsFromFinancingActivities,
        Label : 'Other Cash Flows From Financing Activities',
    },
    {
        $Type : 'UI.DataField',
        Value : totalCashFromFinancingActivities,
        Label : 'Total Cash From Financing Activities',
    },
    {
        $Type : 'UI.DataField',
        Value : effectOfExchangeRate,
        Label : 'Effect Of Exchange Rate',
    },
    {
        $Type : 'UI.DataField',
        Value : changeInCash,
        Label : 'Change In Cash',
    },
    {
        $Type : 'UI.DataField',
        Value : issuanceOfStock,
        Label : 'Issuance Of Stock',
    },
]);

annotate service.IncomeStatements_Qtr with @(UI.LineItem #IncomeStatementsQuaterly : [
    {
        $Type : 'UI.DataField',
        Value : ID,
        Label : 'ID',
    },
    {
        $Type : 'UI.DataField',
        Value : totalRevenue,
        Label : 'Total Revenue',
    },
    {
        $Type : 'UI.DataField',
        Value : costOfRevenue,
        Label : 'Cost of Revenue',
    },
    {
        $Type : 'UI.DataField',
        Value : grossProfit,
        Label : 'Gross Profit',
    },
    {
        $Type : 'UI.DataField',
        Value : sellingGeneralAdministrative,
        Label : 'Selling General Admin',
    },
    {
        $Type : 'UI.DataField',
        Value : nonRecurring,
        Label : 'Non Recurring',
    },
    {
        $Type : 'UI.DataField',
        Value : otherOperatingExpenses,
        Label : 'Other Operating Expenses',
    },
    {
        $Type : 'UI.DataField',
        Value : totalOperatingExpenses,
        Label : 'Total Operating Expenses',
    },
    {
        $Type : 'UI.DataField',
        Value : operatingIncome,
        Label : 'Operating Income',
    },
    {
        $Type : 'UI.DataField',
        Value : totalOtherIncomeExpenseNet,
        Label : 'Total Other Income Expense',
    },
    {
        $Type : 'UI.DataField',
        Value : ebit,
        Label : 'EBit',
    },
    {
        $Type : 'UI.DataField',
        Value : interestExpense,
        Label : 'Interest Expense',
    },
    {
        $Type : 'UI.DataField',
        Value : incomeBeforeTax,
        Label : 'Income Before Tax',
    },
    {
        $Type : 'UI.DataField',
        Value : incomeTaxExpense,
        Label : 'Income Tax Expense',
    },
    {
        $Type : 'UI.DataField',
        Value : minorityInterest,
        Label : 'Minority Interest',
    },
    {
        $Type : 'UI.DataField',
        Value : netIncomeFromContinuingOps,
        Label : 'Effect Of Exchange Rate',
    },
    {
        $Type : 'UI.DataField',
        Value : discontinuedOperations,
        Label : 'Change In Cash',
    },
    {
        $Type : 'UI.DataField',
        Value : extraordinaryItems,
        Label : 'Issuance Of Stock',
    },
    {
        $Type : 'UI.DataField',
        Value : effectOfAccountingCharges,
        Label : 'Issuance Of Stock',
    },
    {
        $Type : 'UI.DataField',
        Value : otherItems,
        Label : 'Issuance Of Stock',
    },
    {
        $Type : 'UI.DataField',
        Value : netIncome,
        Label : 'Issuance Of Stock',
    },
    {
        $Type : 'UI.DataField',
        Value : netIncomeApplicableToCommonShares,
        Label : 'Issuance Of Stock',
    },
]);

annotate service.BusinessPartner with {
    company_title @Common.Label : 'Company Title'
};

annotate service.BusinessPartner with {
    company_code @Common.Label : 'Company Code'
};
