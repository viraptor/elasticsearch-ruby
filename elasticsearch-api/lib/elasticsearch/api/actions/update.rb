# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Updates a document with a script or partial document.
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

      # @option arguments [Hash] :body The request definition requires either `script` or partial `doc` (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update.html
      #
      def update(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = HTTP_POST
        path   = if _index && _type && _id
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/#{Utils.__listify(_id)}/_update"
                 else
                   "#{Utils.__listify(_index)}/_update/#{Utils.__listify(_id)}"
end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        if Array(arguments[:ignore]).include?(404)
          Utils.__rescue_from_not_found { perform_request(method, path, params, body).body }
        else
          perform_request(method, path, params, body).body
        end
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:update, [
        :wait_for_active_shards,
        :_source,
        :_source_excludes,
        :_source_includes,
        :lang,
        :refresh,
        :retry_on_conflict,
        :routing,
        :timeout,
        :if_seq_no,
        :if_primary_term
      ].freeze)
    end
    end
end
