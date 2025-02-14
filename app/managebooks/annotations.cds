using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'ID',
        Value: ID,
    },
    {
        $Type: 'UI.DataField',
        Label: 'title',
        Value: title,
    },
    {
        $Type: 'UI.DataField',
        Label: 'stock',
        Value: stock,
    },
]);

// annotate service.Books with @(
//     UI.FieldGroup #GeneratedGroup1: {
//         $Type: 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'ID',
//                 Value: ID,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'title',
//                 Value: title,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'stock',
//                 Value: stock,
//             },
//         ],
//     },
//     UI.Facets                     : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID    : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target: '@UI.FieldGroup#GeneratedGroup1',
//         },
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID    : 'Attachment',
//             Target: 'attachments/@UI.LineItem',
//         }
//     ]
// );

// annotate service.Attachments with @UI: {LineItem: [
//     {Value: content},
//     {Value: status},
//     {Value: createdAt},
//     {Value: createdBy},
//     {Value: note},
// ], };

// annotate service.Attachments {
//     content  @Core.ContentDisposition: {
//         Filename: fileName,
//         Type    : 'inline'
//     }  @Core.Immutable;
// };
