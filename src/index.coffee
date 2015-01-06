Gofer = require 'gofer'
{version} = require '../package.json'

class Singularity extends Gofer
  serviceName: 'singularity'
  serviceVersion: version

Singularity::clearOptionMappers()
Singularity::addOptionMapper (opts) ->
  @applyBaseUrl "#{opts.baseUrl}/api", opts

Singularity::registerEndpoints
  webhooks: require './endpoints/webhooks'

module.exports = Singularity
