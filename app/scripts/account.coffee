'use strict'

class Account

  constructor: ->
    document.querySelector('#account')?.addEventListener 'click', (event) =>
      id = event.target.id.split '-'
      if id.length is 2 and id[0] is 'signin'
        @signin id[1]

  signin: (site) ->
    console.log site


window.Account = Account
