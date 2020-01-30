# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Returns information about whether a particular document type exists. (DEPRECATED)
        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` to check the types across all indices
        # @option arguments [List] :type A comma-separated list of document types to check

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-types-exists.html
        #
        def exists_type(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
          raise ArgumentError, "Required argument 'type' missing" unless arguments[:type]

          arguments = arguments.clone

          _index = arguments.delete(:index)

          _type = arguments.delete(:type)

          method = HTTP_HEAD
          path   = "#{Utils.__listify(_index)}/_mapping/#{Utils.__listify(_type)}"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        alias_method :exists_type?, :exists_type
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:exists_type, [
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :local
        ].freeze)
end
      end
  end
end
