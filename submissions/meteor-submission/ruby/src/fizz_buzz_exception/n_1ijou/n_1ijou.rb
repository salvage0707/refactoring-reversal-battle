class n_1ijou < n_seisu
    StandardError
  def initialize(msg="nは1以上の整数である必要があります")
  super
  end
end

raise ArgumentError