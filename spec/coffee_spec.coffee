zombie = require ('zombie')

describe "Given the transaction page", ->
  describe "when I visit the page", ->

    beforeEach ->
      browser = new zombie.Browser({ debug: true })
      browser.visit "http://localhost:3000/stats", (error, _browser, status) ->
        throw error if(error)
        expect(status).toBe(200)
        asyncSpecDone()
        @browser = _browser
      asyncSpecWait()

    it "should work return the transaction", ->
      browser.fill "email", "anixe"
      browser.fill "password", "anixe-nx"
      browser.pressButton "sign in", ->
        expect(browser.text("title")).toBe("Resfinity Ops")
        rows = browser.queryAll("#transactionTable tbody tr")
        expect(rows.length).toBe(20)
        
        # expect(browser.html()).toMatch( /password/ )
