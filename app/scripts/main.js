/*!
 *
 *  Web Starter Kit
 *  Copyright 2014 Google Inc. All rights reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License
 *
 */
(function () {
  'use strict';

  var querySelector = document.querySelector.bind(document);

  var navdrawerContainer = querySelector('.navdrawer-container');
  var body = document.body;
  var appbarElement = querySelector('.app-bar');
  var menuBtn = querySelector('.menu');
  var main = querySelector('main');

  function closeMenu() {
    body.classList.remove('open');
    appbarElement.classList.remove('open');
    navdrawerContainer.classList.remove('open');
  }

  function toggleMenu() {
    body.classList.toggle('open');
    appbarElement.classList.toggle('open');
    navdrawerContainer.classList.toggle('open');
    navdrawerContainer.classList.add('opened');
  }

  main.addEventListener('click', closeMenu);
  menuBtn.addEventListener('click', toggleMenu);
  navdrawerContainer.addEventListener('click', function (event) {
    if (event.target.nodeName === 'A' || event.target.nodeName === 'LI') {
      closeMenu();
    }
  });

  function setView (view) {
    Handlebars.registerPartial('view', querySelector(view).innerHTML);
    var template = Handlebars.compile(querySelector('#view-template').innerHTML);
    querySelector('#view').innerHTML = template();
  }


  var ROUTES = {
    root: {
      state: 'root',
      title: 'Root',
      url: '/',
      partial: '#home-partial'
    },
    notes: {
      state: 'notes',
      title: 'Notes',
      url: '/notes',
      partial: '#note-partial'
    },
    about: {
      state: 'about',
      title: 'About',
      url: '/about',
      partial: '#home-partial'
    }
  }

  var navItems = document.querySelectorAll('#navigation li a');
  for (var i = 0, l = navItems.length; i < l; i++) {
    navItems[i].addEventListener('click', function (event) {
      event.preventDefault();

      var id = event.target.id || 'root';
      window.history.pushState(ROUTES[id].state, ROUTES[id].title, ROUTES[id].url);
      loadContent(id);
    });
  }

  function loadContent (id) {
    setView(ROUTES[id].partial);
  }

  window.addEventListener('popstate', function (event) {
    var id = event.state || 'root';
    loadContent(id);
  });

  setView('#home-partial');
})();
