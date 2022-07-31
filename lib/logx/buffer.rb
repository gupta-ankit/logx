# frozen_string_literal: true

module Logx
  class Buffer
    def append(**keyargs)
      @contents = {**contents, **keyargs}
    end

    def contents
      @contents ||= {}
    end

    def reset
      @contents = {}
    end
  end
end