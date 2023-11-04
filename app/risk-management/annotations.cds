using RiskService as service from '../../srv/risk-service';

annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Título',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigacin}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Propietario}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Prioridad}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impacto',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : 'Contacto',
        },
    ]
);
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Ttulo}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation',
            ID : 'Mitigation',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },],
        },]
);
annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : 'Prioridad'
};
annotate service.Risks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Ttulo}',
            },{
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Propietario}',
            },{
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Descripcin}',
            },{
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },{
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impacto}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : 'Contacto',
            },
            ],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitigacin}',
            },{
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Propietario}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'Calendario',
            },],
    }
);
annotate service.Risks with {
    miti @Common.Text : miti.descr
};
annotate service.Risks with {
    miti @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : '{i18n>Mitigaciones}',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Mitigations with {
    ID @Common.Text : descr
};
annotate service.Risks with {
    owner @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};

annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
