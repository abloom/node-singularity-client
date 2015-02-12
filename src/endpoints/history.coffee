module.exports = (request) ->
  task: (taskId, cb) ->
    request "/history/task/#{taskId}", {
      method: 'GET'
    }, cb
