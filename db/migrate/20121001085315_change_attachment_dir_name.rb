class ChangeAttachmentDirName < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute("UPDATE paperclipdb SET dir_name='/paperclipdb'+dir_name")
  end

  def down
    ActiveRecord::Base.connection.execute("UPDATE paperclipdb SET dir_name=REPLACE(dir_name, '/paperclipdb', '')")
  end
end
