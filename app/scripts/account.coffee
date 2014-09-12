'use strict'

class Account

  constructor: ->
    document.querySelector('#account')?.addEventListener 'click', (event) ->
      console.log event.target.id


window.Account = Account
