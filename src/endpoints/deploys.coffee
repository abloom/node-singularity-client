module.exports = (request) ->
  create: (deploy, user, cb) ->
    unless cb
      cb = user
      user = undefined

    request '/deploys', {
      method: 'POST'
      json: {deploy}
    }, cb

  delete: (deployId, requestId, user, cb) ->
    unless cb
      cb = user
      user = undefined

    request '/deploys/deploy/{deployId}/request/{requestId}', {
      method: 'DELETE'
      pathParams: {deployId, requestId}
      qs: {user}
    }, cb

  pending: (cb) ->
    request '/deploys/pending', {
      method: 'GET'
    }, cb
