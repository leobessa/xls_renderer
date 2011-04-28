require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "xls request of a xlsable object send a xls file" do
    visit xlsable_path('xls')
    assert_equal 'binary', headers['Content-Transfer-Encoding']
    assert_equal 'attachment; filename="data.xls"', headers['Content-Disposition']
    assert_equal 'application/vnd.ms-excel', headers['Content-Type']
    assert_match /xlsable contents/, page.body
  end

  test "xls request of a xls object send a xls file" do
    visit xls_writer_path('xls')
    assert_equal 'binary', headers['Content-Transfer-Encoding']
    assert_equal 'attachment; filename="spreadsheet.xls"', headers['Content-Disposition']
    assert_equal 'application/vnd.ms-excel', headers['Content-Type']
    assert_match /xls_writer contents/, page.body
  end
  
  protected
  
  def headers
    page.response_headers
  end
end
