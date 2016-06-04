class AddAttachmentToWebsite < ActiveRecord::Migration
  def change
    add_attachment :websites, :logo
  end
end
