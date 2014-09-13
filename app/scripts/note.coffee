'use struct'

class Note

  constructor: ->
    @onResize()
    window.addEventListener 'resize', =>
      @onResize()

  onResize: ->
    bodyHeight = document.body.clientHeight
    headerHeight = document.querySelector('header').clientHeight
    noteHeight = (bodyHeight - headerHeight) + 'px'

    view = document.querySelector '#view'
    view.style.height = noteHeight

    note = document.querySelector '#note-container'
    note.style.height = noteHeight


window.Note = Note
