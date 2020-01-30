# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Provides low-level information about the segments in the shards of an index.
        #
        # @option arguments [List] :index A comma-separated list of index names to limit the returned information

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-segments.html
        #
        def segments(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_GET
          path   = if _index
                     "_cat/segments/#{Utils.__listify(_index)}"
                   else
                     "_cat/segments"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end
        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:segments, [
          :format,
          :bytes,
          :h,
          :help,
          :s,
          :v
        ].freeze)
end
      end
  end
end
