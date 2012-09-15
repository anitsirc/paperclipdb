Rails.application.routes.draw do
  match '/*dir_name/:file_name.:format' => 'paperclipdb/attachments#get_attachment'
end
