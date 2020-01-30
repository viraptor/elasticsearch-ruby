# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Performs the flush operation on one or more indices.
        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` or empty string for all indices

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-flush.html
        #
        def flush(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_POST
          path   = if _index
                     "#{Utils.__listify(_index)}/_flush"
                   else
                     "_flush"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:flush, [
          :force,
          :wait_if_ongoing,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards
        ].freeze)
end
      end
  end
end
