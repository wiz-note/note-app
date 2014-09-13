'use strict';

class NavBar

  appbarElement: null
  navdrawerContainer: null

  constructor: ->
    main = document.querySelector 'main'
    main.addEventListener 'click', @closeMenu

    @appbarElement = document.querySelector '.app-bar'
    console.log @appbarElement

    menuBtn = document.querySelector '.menu'
    menuBtn.addEventListener 'click', @toggleMenu

    @navdrawerContainer = document.querySelector '.navdrawer-container'
    @navdrawerContainer.addEventListener 'click', =>
      if (event.target.nodeName is 'A' || event.target.nodeName is 'LI')
        @closeMenu()

  closeMenu: =>
    document.body.classList.remove 'open'
    @appbarElement.classList.remove 'open'
    @navdrawerContainer.classList.remove 'open'

  toggleMenu: =>
    document.body.classList.toggle 'open'
    @appbarElement.classList.toggle 'open'
    @navdrawerContainer.classList.toggle 'open'
    @navdrawerContainer.classList.add 'opened'


window.NavBar = NavBar
