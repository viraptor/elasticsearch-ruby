# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Allows a user to validate a potentially expensive query without executing it.
        #
        # @option arguments [List] :index A comma-separated list of index names to restrict the operation; use `_all` or empty string to perform the operation on all indices          #
        # *Deprecation notice*:
        # Specifying types in urls has been deprecated
        # Deprecated since version 7.0.0
        #

        # @option arguments [List] :type A comma-separated list of document types to restrict the operation; leave empty to perform the operation on all types *Deprecated*          #
        # *Deprecation notice*:
        # Specifying types in urls has been deprecated
        # Deprecated since version 7.0.0
        #

        # @option arguments [Hash] :body The query definition specified with the Query DSL

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-validate.html
        #
        def validate_query(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          _type = arguments.delete(:type)

          method = HTTP_GET
          path   = if _index && _type
                     "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_validate/query"
                   elsif _index
                     "#{Utils.__listify(_index)}/_validate/query"
                   else
                     "_validate/query"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = arguments[:body]

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:validate_query, [
          :explain,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :q,
          :analyzer,
          :analyze_wildcard,
          :default_operator,
          :df,
          :lenient,
          :rewrite,
          :all_shards
        ].freeze)
end
      end
  end
end
