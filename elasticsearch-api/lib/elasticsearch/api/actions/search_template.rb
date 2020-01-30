# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Allows to use the Mustache language to pre-render a search definition.
      #
      # @option arguments [List] :index A comma-separated list of index names to search; use `_all` or empty string to perform the operation on all indices          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [List] :type A comma-separated list of document types to search; leave empty to perform the operation on all types          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [Hash] :body The search definition template and its params (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-template.html
      #
      def search_template(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_GET
        path   = if _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_search/template"
                 elsif _index
                   "#{Utils.__listify(_index)}/_search/template"
                 else
                   "_search/template"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:search_template, [
        :ignore_unavailable,
        :ignore_throttled,
        :allow_no_indices,
        :expand_wildcards,
        :preference,
        :routing,
        :scroll,
        :search_type,
        :explain,
        :profile,
        :typed_keys,
        :rest_total_hits_as_int
      ].freeze)
    end
    end
end
