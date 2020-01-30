# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Provides a detailed view of shard allocation on nodes.
        #
        # @option arguments [List] :index A comma-separated list of index names to limit the returned information

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-shards.html
        #
        def shards(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_GET
          path   = if _index
                     "_cat/shards/#{Utils.__listify(_index)}"
                   else
                     "_cat/shards"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          params[:h] = Utils.__listify(params[:h]) if params[:h]

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:shards, [
          :format,
          :bytes,
          :local,
          :master_timeout,
          :h,
          :help,
          :s,
          :time,
          :v
        ].freeze)
end
      end
  end
end
