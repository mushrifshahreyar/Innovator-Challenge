using BusinessPartnerService as service from '../../srv/businesspartner';

annotate service.Prediction_Rule with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'P_Case',
            Value : P_Case,
        },
        {
            $Type : 'UI.DataField',
            Label : 'GDP_Growth',
            Value : GDP_Growth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Sales_Growth',
            Value : Sales_Growth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'COGS_Margin',
            Value : COGS_Margin,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Cost_Inflation',
            Value : Cost_Inflation,
        },
    ]
);
annotate service.Prediction_Rule with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'P_Case',
                Value : P_Case,
            },
            {
                $Type : 'UI.DataField',
                Label : 'GDP_Growth',
                Value : GDP_Growth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Sales_Growth',
                Value : Sales_Growth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'COGS_Margin',
                Value : COGS_Margin,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Cost_Inflation',
                Value : Cost_Inflation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Taxes',
                Value : Taxes,
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
