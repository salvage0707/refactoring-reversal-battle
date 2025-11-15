class n_seisu < kihon_no_reigai
    StandardError
  def initialize(msg="nは整数である必要があります")
  super
  end
end

raise ArgumentError