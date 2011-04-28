require 'test_helper'

class XlsRendererTest < ActiveSupport::TestCase

  class XlsRendererContext
    def send_data(*args);end
    define_method(:render_xls, &ActionController::Renderers::RENDERERS[:xls])
  end

  include Mocha::API
  test "xls mime type" do
    assert_equal :xls, Mime::XLS.to_sym
    assert_equal "application/vnd.ms-excel", Mime::XLS.to_s
  end

  test "to_xls call" do
    xlsable = mock()
    options = {:key => "value" }
    xlsable.expects(:to_xls).with(options).returns(StringIO.new('content'))
    XlsRendererContext.new.render_xls(xlsable,options)
  end

end