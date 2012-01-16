zombie = require('zombie')
vows = require('vows')
assert  = require('assert')

vows.describe('Resfinity Ops').addBatch
  "transactions":
    topic: ->
      browser = new zombie.Browser({ debug: true })
      browser.visit("http://localhost:3009", @callback)

    "login":
      topic: (browser) ->
        console.log("login!")
        browser
          .fill("email", "user")
          .fill("password", "password")
          .pressButton("sign in", @callback)

      "should have the right page title": (browser) ->
        assert.equal browser.document.title, "Resfinity Ops"

      "should have a list of transactions": (browser) ->
        rows = browser.queryAll("#transactionTable tbody tr")
        assert.equal(20, rows.length)


.export(module)
