class AddDomainToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :domain, :string
  end
end
