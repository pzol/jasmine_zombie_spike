describe 'Given I visit the transactions page', ->
  user = new TestUser()

  beforeEach -> 
    user.gotoTransactionPage()

  
  it 'sees the page header', ->
    expect(user).toSee('Transactions')


  it 'sees older, newer and newest links for navigation', ->
    expect(user.page.text("title")).toBe("Resfinity Ops")
    expect(user).toSee('real time system monitoring')
    expect(user).toSeeLink('older')
    expect(user).toSeeLink('newer')
    expect(user).toSeeLink('newest')
    

  it 'sees a transaction table, where all rows should have valid data', -> 
    _.each user.tableRows(), (tr) ->
      expect(tr.getAttribute('data-id')).toBeTruthy()
      expect(tr.getAttribute('data-href')).toBeTruthy()
