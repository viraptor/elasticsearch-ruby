# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Returns a document.
      #
      # @option arguments [String] :id The document ID          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [String] :index The name of the index          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      # @option arguments [String] :type The type of the document (use `_all` to fetch the first document matching the ID across all types) *Deprecated*          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
      #
      def get(arguments = {})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_GET
        path   = if _index && _type && _id
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/#{Utils.__listify(_id)}"
                 else
                   "#{Utils.__listify(_index)}/_doc/#{Utils.__listify(_id)}"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = nil

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:get, [
        :stored_fields,
        :preference,
        :realtime,
        :refresh,
        :routing,
        :_source,
        :_source_excludes,
        :_source_includes,
        :version,
        :version_type
      ].freeze)
    end
    end
end
