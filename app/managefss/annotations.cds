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
            Label : 'company_title',
            Value : company_title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'company_code',
            Value : company_code,
        },
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
                Label : 'company_title',
                Value : company_title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'company_code',
                Value : company_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
