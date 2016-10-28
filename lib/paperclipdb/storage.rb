module Paperclip
  module Storage
    module Database
      def self.extended(base)
        base.instance_eval do
          override_default_options base
        end
      end

      def override_default_options(base)
        @path = @url
        @url = "/paperclipdb#{@url}"
      end
      private :override_default_options

      def exists?(style = default_style)
        return not(getAttachment(path(style)).nil?)
      end

      def getAttachment(file_path)
        file_path = rel_path(file_path)
        return Paperclipdb::Attachment.where(base_name: File.basename(file_path), dir_name: File.dirname(file_path)).first
      end

      def to_file style = default_style
        if @queued_for_write[style]
        @queued_for_write[style]
        elsif exists?(style)
          attachment = getAttachment(path(style))
          tempfile = Tempfile.new attachment.base_name
          tempfile.write attachment.file_data
          tempfile
        else
          nil
        end
      end

      def flush_writes
        @queued_for_write.each do |style, file|
          attachment = Paperclipdb::Attachment.new
          attachment.base_name = File.basename(rel_path(path(style)))
          attachment.dir_name = File.dirname(rel_path(path(style)))
          attachment.content_type = file.content_type
          attachment.file_size = file.size
          attachment.file_data = file.read
          attachment.save
        end
        @queued_for_write = {}
      end

      def flush_deletes
        @queued_for_delete.each do |path|
          attachment = getAttachment(path)          
          attachment.destroy if attachment          
        end
        @queued_for_delete = []
      end
      
      def rel_path path
        path.to_s.gsub(File.join(Rails.root, 'public'), '')
      end
    end
  end
end
