'use strict'

class Route

  ROUTES:
    root:
      title: 'Root'
      url: '/'
      partial: '#partial-home'
      init: [Account]
    notes:
      title: 'Notes'
      url: '/notes'
      partial: '#partial-note'
      init: [Note]
    about:
      title: 'About'
      url: '/about'
      partial: '#partial-home'

  classPool: null

  constructor: ->
    navItems = document.querySelectorAll '#navigation li a'
    for item in navItems
      item.addEventListener 'click', @onClickNavItem

    window.addEventListener 'popstate', (event) =>
      state = event.state || 'root'
      @setView state

    @setView 'root'

  onClickNavItem: (event) =>
    state = event.target.id || 'root'
    window.history.pushState state, @ROUTES[state].title, @ROUTES[state].url
    @setView state

  setView: (state) ->
    partial = @ROUTES[state].partial
    Handlebars.registerPartial 'view', document.querySelector(partial).innerHTML
    template = Handlebars.compile document.querySelector('#view-template').innerHTML
    document.querySelector('#view').innerHTML = template()

    if @ROUTES[state].init?
      @classPool = []
      for klass in @ROUTES[state].init
        @classPool.push new klass()

    return


window.Route = Route
