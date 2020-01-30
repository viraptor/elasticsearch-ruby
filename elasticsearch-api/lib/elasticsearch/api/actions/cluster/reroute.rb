# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cluster
      module Actions
        # Allows to manually change the allocation of individual shards in the cluster.
        #
        # @option arguments [Hash] :body The definition of `commands` to perform (`move`, `cancel`, `allocate`)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cluster-reroute.html
        #
        def reroute(arguments = {})
          arguments = arguments.clone

          method = HTTP_POST
          path   = "_cluster/reroute"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = arguments[:body]

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:reroute, [
          :dry_run,
          :explain,
          :retry_failed,
          :metric,
          :master_timeout,
          :timeout
        ].freeze)
end
      end
  end
end
