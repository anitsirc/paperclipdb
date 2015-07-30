require_dependency "paperclipdb/application_controller"

module Paperclipdb
  class AttachmentsController < ApplicationController
    def get_attachment
      dir_name = '/paperclipdb/' + params[:dir_name]
      base_name = params[:file_name] + '.' + params[:format]
      attachment = Paperclipdb::Attachment.where(base_name: base_name, dir_name: dir_name).first
      if(attachment == nil)
        raise ActionController::RoutingError.new('Image not Found')
      else
        send_data(attachment.file_data)
      end
    end
  end
end
