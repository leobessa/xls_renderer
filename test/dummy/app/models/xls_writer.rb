class XlsWriter
  def initialize(data)
    @data = data
  end
  def write(io)
    io << @data
  end
  def to_xls(options = {})
    self
  end
end