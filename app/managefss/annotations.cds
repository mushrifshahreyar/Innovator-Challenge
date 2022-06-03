using BusinessPartnerService as service from '../../srv/businesspartner';

annotate service.BusinessPartner with @(
    UI.LineItem : [
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
    UI.SelectionFields: [
        ID,
        company_code ,
        company_title
    ],
);

annotate service.BusinessPartner with @(
    UI.HeaderInfo: {
        Title : {
            $Type : 'UI.DataField',
            Label : 'Company Title',
            Value : company_title,
        },
        Description : {
            $Type : 'UI.DataField',
            Label : 'Company Code',
            Value : company_code,
        },
        TypeName : 'Business Partner',
        TypeNamePlural : 'Business Partners',

        ImageUrl : 'https://i.pinimg.com/originals/03/32/88/033288573e174c88f2f3b3c789b75212.jpg',
    },

    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
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

    UI.HeaderFacets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneratedFacet1',
            Label  : 'Company Details',
            Target : '@UI.FieldGroup#GeneratedGroup1'
        }
    ],

);

annotate service.BusinessPartner with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Balance Sheet Quaterly',
            ID : 'BalanceSheetQuaterly',
            Target : 'balancesheet_qtr/@UI.LineItem#BalanceSheetQuaterly',
        },
    ]
);
annotate service.BalanceSheet_Qtr with @(
    UI.LineItem #BalanceSheetQuaterly : [
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

    ]
);
annotate service.BusinessPartner with {
    company_title @Common.Label : 'Company Title'
};
annotate service.BusinessPartner with {
    company_code @Common.Label : 'Company Code'
};
