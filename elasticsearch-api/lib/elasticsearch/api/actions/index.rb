# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Creates or updates a document in an index.
      #
      # @option arguments [String] :id Document ID          #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
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

      # @option arguments [Hash] :body The document (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
      #
      def index(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

        arguments = arguments.clone

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_PUT
        path   = if _index && _type && _id
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/#{Utils.__listify(_id)}"
                 elsif _index && _id
                   "#{Utils.__listify(_index)}/_doc/#{Utils.__listify(_id)}"
                 elsif _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}"
                 else
                   "#{Utils.__listify(_index)}/_doc"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:index, [
        :wait_for_active_shards,
        :op_type,
        :refresh,
        :routing,
        :timeout,
        :version,
        :version_type,
        :if_seq_no,
        :if_primary_term,
        :pipeline
      ].freeze)
    end
    end
end
