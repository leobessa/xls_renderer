# -*- encoding : utf-8 -*-
require 'action_controller'
Mime::Type.register "application/vnd.ms-excel", :xls

ActionController::Renderers.add :xls do |obj, options|
  filename = options[:filename] || "data"
  data = StringIO.new('')
  xls  = obj.respond_to?(:to_xls) ? obj.to_xls(options) : obj
  xls.write(data)
  send_data data.string, :filename => "#{filename}.xls", :type => Mime::XLS,
   :disposition => "attachment"
end