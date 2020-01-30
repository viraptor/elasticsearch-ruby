# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Returns multiple termvectors in one request.
      #
      # @option arguments [String] :index The index in which the document resides.          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [String] :type The type of the document.          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [Hash] :body Define ids, documents, parameters or a list of parameters per document here. You must at least provide a list of document ids. See documentation.

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-termvectors.html
      #
      def mtermvectors(arguments = {})
        arguments = arguments.clone

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_GET
        path   = if _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_mtermvectors"
                 elsif _index
                   "#{Utils.__listify(_index)}/_mtermvectors"
                 else
                   "_mtermvectors"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:mtermvectors, [
        :ids,
        :term_statistics,
        :field_statistics,
        :fields,
        :offsets,
        :positions,
        :payloads,
        :preference,
        :routing,
        :realtime,
        :version,
        :version_type
      ].freeze)
    end
    end
end
