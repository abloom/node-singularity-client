Gofer = require 'gofer'
{version} = require '../package.json'

class Singularity extends Gofer
  serviceName: 'singularity'
  serviceVersion: version

Singularity::clearOptionMappers()
Singularity::addOptionMapper (opts) ->
  @applyBaseUrl "#{opts.baseUrl}/api", opts

Singularity::registerEndpoints
  deploys:  require './endpoints/deploys'
  requests: require './endpoints/requests'
  webhooks: require './endpoints/webhooks'
  history: require './endpoints/history'

module.exports = Singularity
