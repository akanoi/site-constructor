$ ->
  split = (val) ->
    val.split /,\s*/

  extractLast = (term) ->
    split(term).pop()

  $('#site_tag_list').autocomplete
    minLength: 0
    source: (request, response) ->
      response $.ui.autocomplete.filter($('#site_tag_list').data('autocomplete-source'), extractLast(request.term))
      return
    select: (event, ui) ->
      terms = split(@value)
      terms.pop()
      terms.push ui.item.value
      terms.push ''
      @value = terms.join(', ')
      false
  return