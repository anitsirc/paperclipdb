class ChangeAttachmentDirName < ActiveRecord::Migration
  def up
    Paperclipdb::Attachment.all.each{|a| a.update_attribute(:dir_name, "/paperclipdb#{a.dir_name}") unless a.dir_name.start_with?("/paperclipdb")}
  end

  def down
    Paperclipdb::Attachment.all.each{|a| a.update_attribute(:dir_name, a.dir_name.gsub("/paperclipdb/", "/")) if a.dir_name.start_with?("/paperclipdb")}
  end
end
