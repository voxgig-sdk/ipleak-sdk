# Ipleak SDK utility: make_context
require_relative '../core/context'
module IpleakUtilities
  MakeContext = ->(ctxmap, basectx) {
    IpleakContext.new(ctxmap, basectx)
  }
end
