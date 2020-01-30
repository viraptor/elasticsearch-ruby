# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Returns settings for one or more indices.
        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indices
        # @option arguments [List] :name The name of the settings that should be included

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-settings.html
        #
        def get_settings(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          _name = arguments.delete(:name)

          method = HTTP_GET
          path   = if _index && _name
                     "#{Utils.__listify(_index)}/_settings/#{Utils.__listify(_name)}"
                   elsif _index
                     "#{Utils.__listify(_index)}/_settings"
                   elsif _name
                     "_settings/#{Utils.__listify(_name)}"
                   else
                     "_settings"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_settings, [
          :master_timeout,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :flat_settings,
          :local,
          :include_defaults
        ].freeze)
end
      end
  end
end
