'use strict'

ROUTES =
  root:
    state: 'root'
    title: 'Root'
    url: '/'
    partial: '#home-partial'
  notes:
    state: 'notes'
    title: 'Notes'
    url: '/notes'
    partial: '#note-partial'
  about:
    state: 'about'
    title: 'About'
    url: '/about'
    partial: '#home-partial'


setView = (id) ->
  view = ROUTES[id].partial
  Handlebars.registerPartial 'view', document.querySelector(view).innerHTML
  template = Handlebars.compile document.querySelector('#view-template').innerHTML
  document.querySelector('#view').innerHTML = template()

onClickNavItem = (event) ->
  event.preventDefault()

  id = event.target.id || 'root'
  window.history.pushState ROUTES[id].state, ROUTES[id].title, ROUTES[id].url
  setView id

navItems = document.querySelectorAll '#navigation li a'
for item in navItems
  item.addEventListener 'click', onClickNavItem

window.addEventListener 'popstate', (event) ->
  id = event.state || 'root'
  setView id

setView 'root'
