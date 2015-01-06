module.exports = (request) ->
  create: (hook, uri, cb) ->
    payload =
      uri: "#{uri}/#{hook}"
      type: hook.toUpperCase()

    request '/webhooks', {
      method: 'POST'
      json: payload
      parseJSON: false
    }, cb

  delete: (hook, uri, cb) ->
    request '/webhooks/{uri}', {
      method: 'DELETE'
      pathParams: {
        uri: "#{hook.toUpperCase()}-#{uri}/#{hook}"
      }
    }, cb

