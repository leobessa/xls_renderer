class Xlsable
  def initialize(content)
    @content = content
  end
  def to_xls(options = {})
    XlsWriter.new(@content)
  end
end