# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Allows to get multiple documents in one request.
      #
      # @option arguments [String] :index The name of the index          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [String] :type The type of the document *Deprecated*          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [Hash] :body Document identifiers; can be either `docs` (containing full document information) or `ids` (when index and type is provided in the URL. (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-get.html
      #
      def mget(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_GET
        path   = if _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_mget"
                 elsif _index
                   "#{Utils.__listify(_index)}/_mget"
                 else
                   "_mget"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:mget, [
        :stored_fields,
        :preference,
        :realtime,
        :refresh,
        :routing,
        :_source,
        :_source_excludes,
        :_source_includes
      ].freeze)
    end
    end
end
