Vue.http.options.xhr = {withCredentials: true}
Vue.http.options.emulateJSON = true

Vue.http.interceptors.push (request, next) ->
  relative_url = request.url[0] == '/'

  if !relative_url
    target_url = new URL(request.url)

  if relative_url || target_url.host == location.host
    request.headers.set('X-CSRF-TOKEN', $('[name="csrf-token"]').attr('content'))
    request.headers.set('Cache-Control', 'no-cache')

  next((response) ->
    message = undefined

    if response.body != null && response.body.hasOwnProperty('message')
      message = response.body.message

    if response.ok
      flash(message, 'success') if message != undefined
    else
      if response.status == 401
        $('#sign-up-modal').modal("show")
      else if response.status == 422
        flash(message, 'danger') if message != undefined
      else
        # TODO i18n
        message = "An error has occurred" if message == undefined
        flash(message, 'danger')

    return response
  )
