class HomeController < ApplicationController

  def xlsable
    respond_to do |format|
      format.xls do 
        render :xls => Xlsable.new("xlsable contents")
      end
    end
  end

  def xls_writer
    respond_to do |format|
      format.xls do 
        render :xls => XlsWriter.new("xls_writer contents"), 
        :filename => 'spreadsheet'
      end
    end
  end

end