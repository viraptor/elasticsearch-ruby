# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Tasks
      module Actions
        # Returns a list of tasks.
        #

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/tasks.html
        #
        def list(arguments = {})
          arguments = arguments.clone

          method = HTTP_GET
          path   = "_tasks"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:list, [
          :nodes,
          :actions,
          :detailed,
          :parent_task_id,
          :wait_for_completion,
          :group_by,
          :timeout
        ].freeze)
end
      end
  end
end
