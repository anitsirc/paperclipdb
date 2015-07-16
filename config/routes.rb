Rails.application.routes.draw do
  get '/paperclipdb/*dir_name/:file_name.:format' => 'paperclipdb/attachments#get_attachment'
end
