class CreatePaperclipdbAttachments < ActiveRecord::Migration
  def change
    create_table :paperclipdb_attachments do |t|
      t.string :dir_name, :null => false
      t.string :base_name, :null => false
      t.binary :file_data, :null => false
      t.string :content_type
      t.integer :file_size
      t.timestamps
    end
    add_index :paperclipdb_attachments, [:base_name, :dir_name], :unique => true
  end
end
