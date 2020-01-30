# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Returns information about existing templates.
        #
        # @option arguments [String] :name A pattern that returned template names must match

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-templates.html
        #
        def templates(arguments = {})
          arguments = arguments.clone

          _name = arguments.delete(:name)

          method = HTTP_GET
          path   = if _name
                     "_cat/templates/#{Utils.__listify(_name)}"
                   else
                     "_cat/templates"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:templates, [
          :format,
          :local,
          :master_timeout,
          :h,
          :help,
          :s,
          :v
        ].freeze)
end
      end
  end
end
