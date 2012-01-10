var zombie = require( 'zombie' );

describe( "Given I am a new user", function() {
  describe( "When I visit the home page", function() {
    var browser;

    beforeEach( function() {
      zombie.visit( "http://localhost:3000",
      function( error, _browser, status ) {
        if( error ) throw error;
        expect( status ).toBe( 200 );
        browser = _browser;
        asyncSpecDone();
      });
      asyncSpecWait();
    });

    it( "Then I see 'INNOVATION  FOR  TRAVEL & TOURISM'", function() {
      expect( browser.html() ).toMatch( /password/ );
    });
  });
});
