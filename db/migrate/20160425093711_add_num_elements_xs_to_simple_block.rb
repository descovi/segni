class AddNumElementsXsToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :num_elements_xs, :integer
  end
end
