// @apiVersion 0.0.1
// @name io.ksonnet.pkg.nginx-simple
// @description deploys a simple, stateless nginx server. The nginx server runs
//   as a Deployment, and is exposed to the network with a Service.
// @shortDescription A simple, stateless nginx server.
// @param namespace string Namespace (metadata) that the nginx resources are
//   created under
// @param name string Name (metadata) to identify all resources defined by this
//   prototype

local k = import 'k.libsonnet';
local nginx = import 'incubator/nginx/nginx.libsonnet';

local namespace = import 'param://namespace';
local appName = import 'param://name';

k.core.v1.list.new([
  nginx.parts.deployment.simple(namespace, appName),
  nginx.parts.service(namespace, appName),
])
