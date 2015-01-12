module.exports = (request) ->
  funcs =
    all: (cb) ->
      request '/requests', {
        method: 'GET'
      }, cb

    create: (payload, user, cb) ->
      unless cb
        cb = user
        user = undefined

      request '/requests', {
        method: 'POST'
        qs: {user}
        json: payload
      }, cb

    get: (requestId, cb) ->
      request '/requests/request/{requestId}', {
        method: 'GET'
        pathParams: {requestId}
      }, cb

    delete: (requestId, cb) ->
      request '/requests/request/{requestId}', {
        method: 'DELETE'
        pathParams: {requestId}
      }, cb

    bounce: (requestId, user, cb) ->
      unless cb
        cb = user
        user = undefined

      request '/requests/request/{requestId}/bounce', {
        method: 'POST'
        pathParams: {requestId}
        qs: {user}
      }, cb

    scale: (instanceCount, user, cb) ->
      unless cb
        cb = user
        user = undefined

      request '/requests/request/{requestId}/instances', {
        method: 'PUT'
        pathParams: {requestId}
        qs: {user}
        json: {
          instances: instanceCount
          #id: ?? - optional
        }
      }, cb

    pause: (user, cb) ->
      throw "not documented, dont know what the body should include"

      unless cb
        cb = user
        user = undefined

      request '/requests/request/{requestId}/pause', {
        method: 'POST'
        pathParams: {requestId}
        qs: {user}
        #json: {}
      }, cb

    unpause: (user, cb) ->
      unless cb
        cb = user
        user = undefined

      request '/requests/request/{requestId}/unpause', {
        method: 'POST'
        pathParams: {requestId}
        qs: {user}
      }, cb

    run: (cmdlineArgs, user, cb) ->
      unless cb
        cb = user
        user = undefined

      request '/api/requests/request/{requestId}/run', {
        method: 'POST'
        pathParams: {requestId}
        qs: {user}
        body: cmdlineArgs
      }, cb

  for status in ["active", "cooldown", "finished", "paused", "queued/cleanup", "queued/pending"]
    funcs[status] = (cb) ->
      request "/requests/#{status}", {
        method: 'GET'
      }, cb

  funcs
