# frozen_string_literal: true

require 'logx/buffer'

module Logx
  class CurrentBuffer
    THREAD_NAMESPACE = :_logx_current_buffer

    class << self
      def instance
        Thread.current[THREAD_NAMESPACE] ||= new
      end

      def append(**kwargs)
        instance.append(**kwargs)
      end

      def reset
        instance.reset
      end

      def contents
        instance.contents
      end
    end

    def initialize
      @buffer = Logx::Buffer.new
    end

    def append(**keyvals)
      @buffer.append(**keyvals)
    end

    def contents
      @buffer.contents
    end

    def reset
      @buffer.reset
    end
  end
end