sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/demo/managebooks/managebooksv2/test/integration/FirstJourney',
		'com/demo/managebooks/managebooksv2/test/integration/pages/BooksList',
		'com/demo/managebooks/managebooksv2/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/demo/managebooks/managebooksv2') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);