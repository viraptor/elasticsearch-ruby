# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Creates an index with optional settings and mappings.
        #
        # @option arguments [String] :index The name of the index
        # @option arguments [Hash] :body The configuration for the index (`settings` and `mappings`)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-create-index.html
        #
        def create(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_PUT
          path   = "#{Utils.__listify(_index)}"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = arguments[:body]

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:create, [
          :include_type_name,
          :wait_for_active_shards,
          :timeout,
          :master_timeout
        ].freeze)
end
      end
  end
end
