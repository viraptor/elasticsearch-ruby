# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Returns number of documents matching a query.
      #
      # @option arguments [List] :index A comma-separated list of indices to restrict the results          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [List] :type A comma-separated list of types to restrict the results          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [Hash] :body A query to restrict the results specified with the Query DSL (optional)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-count.html
      #
      def count(arguments = {})
        arguments = arguments.clone

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_POST
        path   = if _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_count"
                 elsif _index
                   "#{Utils.__listify(_index)}/_count"
                 else
                   "_count"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:count, [
        :ignore_unavailable,
        :ignore_throttled,
        :allow_no_indices,
        :expand_wildcards,
        :min_score,
        :preference,
        :routing,
        :q,
        :analyzer,
        :analyze_wildcard,
        :default_operator,
        :df,
        :lenient,
        :terminate_after
      ].freeze)
    end
    end
end
