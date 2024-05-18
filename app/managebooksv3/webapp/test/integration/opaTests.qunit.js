sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/demo/managebooks/managebooksv3/test/integration/FirstJourney',
		'com/demo/managebooks/managebooksv3/test/integration/pages/BooksList',
		'com/demo/managebooks/managebooksv3/test/integration/pages/BooksObjectPage',
		'com/demo/managebooks/managebooksv3/test/integration/pages/AttachmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage, AttachmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/demo/managebooks/managebooksv3') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage,
					onTheAttachmentsObjectPage: AttachmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);