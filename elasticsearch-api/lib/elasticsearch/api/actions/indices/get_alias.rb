# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Returns an alias.
        #
        # @option arguments [List] :name A comma-separated list of alias names to return
        # @option arguments [List] :index A comma-separated list of index names to filter aliases

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
        #
        def get_alias(arguments = {})
          arguments = arguments.clone

          _name = arguments.delete(:name)

          _index = arguments.delete(:index)

          method = HTTP_GET
          path   = if _index && _name
                     "#{Utils.__listify(_index)}/_alias/#{Utils.__listify(_name)}"
                   elsif _index
                     "#{Utils.__listify(_index)}/_alias"
                   elsif _name
                     "_alias/#{Utils.__listify(_name)}"
                   else
                     "_alias"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_alias, [
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :local
        ].freeze)
end
      end
  end
end
