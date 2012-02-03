
uniqueId = (length=8) ->
  id = ""
  id += Math.random().toString(36).substr(2) while id.length < length
  id.substr 0, length


jQuery ->
  $("#user_email").blur ->
    if window.location.pathname.indexOf("sign_up") > -1
      $("#user_password").attr("value", uniqueId())
