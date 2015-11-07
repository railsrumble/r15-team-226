class AddFileUidToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :file_uid, :string
  end
end
