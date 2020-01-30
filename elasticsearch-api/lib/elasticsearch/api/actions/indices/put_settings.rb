# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Updates the index settings.
        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indices
        # @option arguments [Hash] :body The index settings to be updated (*Required*)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-update-settings.html
        #
        def put_settings(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_PUT
          path   = if _index
                     "#{Utils.__listify(_index)}/_settings"
                   else
                     "_settings"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = arguments[:body]

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:put_settings, [
          :master_timeout,
          :timeout,
          :preserve_existing,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :flat_settings
        ].freeze)
end
      end
  end
end
