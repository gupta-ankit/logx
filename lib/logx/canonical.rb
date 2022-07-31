require 'logx/current_buffer'

module Logx
  class Canonical

    attr_reader :log

    def initialize(log)
      @log = log
    end

    def flush
      log.info CurrentBuffer.contents.to_json
      CurrentBuffer.reset
    end

    def append(**kwargs)
      CurrentBuffer.append(**kwargs)
    end
  end
end