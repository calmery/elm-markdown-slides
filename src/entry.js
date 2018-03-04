import './static/index.html'

import './static/css/default.css'
import './static/css/layout.css'

import Elm from './elm/Main.elm'
import hljs from 'highlight.js'

const app = Elm.Main.fullscreen()

document.body.addEventListener( 'DOMSubtreeModified', e => {
  const elements = [].slice.call( document.querySelectorAll( 'pre code' ) )
  if( elements.indexOf( e.target ) !== -1 ) return

  elements.forEach( hljs.highlightBlock )
}, false )
