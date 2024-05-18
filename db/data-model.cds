namespace my.bookshop;

using {
  cuid,
  managed
} from '@sap/cds/common';

entity Books {
  key ID          : Integer;
      title       : String;
      stock       : Integer;
      attachments : Composition of many Attachments;
}

// extend Books with {
//   attachments : Composition of many Attachments;
// }

aspect MediaData         @(_is_media_data) {
  url      : String;
  content  : LargeBinary @title: 'Attachment';
  mimeType : String      @title: 'Media Type' default 'application/octect-stream';
  fileName : String      @title: 'File Name';
  status   : String      @title: 'Status' enum {
    Unscanned;
    Scanning;
    Infected;
    Clean;
  } default 'Unscanned';
}

aspect Attachments : cuid, managed, MediaData {
  note : String @title: 'Note'
}

// Annotate the Media Data
annotate MediaData {
  content  @Core.MediaType: mimeType  @odata.draft.skip;
  mimeType @Core.IsMediaType;
}

annotate MediaData with @UI.MediaResource: {Stream: content};

// Annotate the Attachment
annotate Attachments with @UI: {LineItem: [
  {Value: content},
  {Value: status},
  {Value: createdAt},
  {Value: createdBy},
  {Value: note},
]};

annotate Attachments {
  content  @Core.ContentDisposition: {
    Filename: fileName,
    Type    : 'inline'
  }  @Core.Immutable;
};

annotate Books with @(
  UI.FieldGroup #GeneratedGroup1: {
    $Type: 'UI.FieldGroupType',
    Data : [
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
    ],
  },
  UI.Facets                     : [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'GeneratedFacet1',
      Label : 'General Information',
      Target: '@UI.FieldGroup#GeneratedGroup1',
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'attachment',
      Label : 'Attachments',
      Target: 'attachments/@UI.LineItem',
    }
  ]
);
