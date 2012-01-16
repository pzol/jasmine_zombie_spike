class root.TestUser
  constructor: (@session) ->
    @session = new zombie.Browser({site: 'http://localhost:3009'})
    @page =  @session
    @setCookies()
  
  setCookies: ->
    @session.loadCookies('rack.session=BAh7CEkiD3Nlc3Npb25faWQGOgZFRiJFODZlYmZhMTU1NmQzMDFlMmUwYzEy%0ANWM0YWNjZGVmOTliZDllMTc1YTdiODFhYzgyY2NkY2VlOTkyYWNlNjUyZEki%0ADl9fRkxBU0hfXwY7AEZ7AEkiHHdhcmRlbi51c2VyLmRlZmF1bHQua2V5BjsA%0AVG86E0JTT046Ok9iamVjdElkBjoKQGRhdGFbEWlSaQHsaQGmaQHkaQG0aQGW%0AaQGyaQH7aQGDaQBpAGkI%0A--b01e9172ca52c257c8d9f771a746ff5c7bfee116; Domain=localhost; Path=/; HttpOnly')

  gotoTransactionPage: () ->
    @session.visit "/stats", (error, _browser, status) ->
      throw error if(error)
      asyncSpecDone()
    asyncSpecWait()

  tableRows: () ->
    @session.queryAll('#transactionTable tbody tr')
