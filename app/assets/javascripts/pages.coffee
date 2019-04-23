$(document).on 'turbolinks:click', (event) ->
  if event.target.getAttribute('href').charAt(0) == '#'
    return event.preventDefault()
  return