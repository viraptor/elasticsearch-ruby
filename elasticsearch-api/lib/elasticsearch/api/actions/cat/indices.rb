# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Returns information about indices: number of primaries and replicas, document counts, disk size, ...
        #
        # @option arguments [List] :index A comma-separated list of index names to limit the returned information

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-indices.html
        #
        def indices(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_GET
          path   = if _index
                     "_cat/indices/#{Utils.__listify(_index)}"
                   else
                     "_cat/indices"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          params[:h] = Utils.__listify(params[:h]) if params[:h]

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:indices, [
          :format,
          :bytes,
          :local,
          :master_timeout,
          :h,
          :health,
          :help,
          :pri,
          :s,
          :time,
          :v,
          :include_unloaded_segments
        ].freeze)
end
      end
  end
end
