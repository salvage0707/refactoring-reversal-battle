class kihon_no_reigai < StandardError
  def initialize(msg="引数がおかしいです！")
  super
  end
end

raise ArgumentError