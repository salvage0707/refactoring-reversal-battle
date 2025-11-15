class suuti_no_exception < kihon_no_reigai
    StandardError
  def initialize(msg="nは数値である必要があります")
  super
  end
end

raise ArgumentError