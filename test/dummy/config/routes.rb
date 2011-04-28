Dummy::Application.routes.draw do
  match "/xlsable(.:format)", :to => "home#xlsable", :as => "xlsable"
  match "/xls_writer(.:format)", :to => "home#xls_writer", :as => "xls_writer"
end
