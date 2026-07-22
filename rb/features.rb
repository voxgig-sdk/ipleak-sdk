# Ipleak SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module IpleakFeatures
  def self.make_feature(name)
    case name
    when "base"
      IpleakBaseFeature.new
    when "test"
      IpleakTestFeature.new
    else
      IpleakBaseFeature.new
    end
  end
end
