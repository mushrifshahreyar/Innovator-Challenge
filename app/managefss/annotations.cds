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
    ]
);

annotate service.BusinessPartner with @(
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

    // UI.FieldGroup #BalanceSheetQtr : {
    //     $Type : 'UI.FieldGroupType',
    //     Data : [
    //         {
    //             $Type : 'UI.DataField',
    //             Label : 'ID',
    //         }
    //     ]
    // },
    
    // UI.Facets : [
    //     {
    //         $Type : 'UI.ReferenceFacet',
    //         ID : 'GeneratedFacet1',
    //         Label : 'General Information',
    //         Target : '@UI.FieldGroup#GeneratedGroup1',
    //     },
    // ]
    UI.HeaderFacets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneratedFacet1',
            Label  : 'Company Details',
            Target : '@UI.FieldGroup#GeneratedGroup1'
        }
    ]
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

        ImageUrl : 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg?w=400',

    },

);
