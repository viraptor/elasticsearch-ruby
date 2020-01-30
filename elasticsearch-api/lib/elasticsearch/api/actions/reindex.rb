# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Allows to copy documents from one index to another, optionally filtering the source
      # documents by a query, changing the destination index settings, or fetching the
      # documents from a remote cluster.
      #
      # @option arguments [Hash] :body The search definition using the Query DSL and the prototype for the index request. (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-reindex.html
      #
      def reindex(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone

        method = HTTP_POST
        path   = "_reindex"
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end
      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:reindex, [
        :refresh,
        :timeout,
        :wait_for_active_shards,
        :wait_for_completion,
        :requests_per_second,
        :scroll,
        :slices,
        :max_docs
      ].freeze)
    end
    end
end
