class AddTemplateToAllRecords < ActiveRecord::Migration
  def change
    # seeding data anche changing stuff
    
    Template.create(name: 'orange')
    Template.create(name: 'gallery')
    
    Website.all.each do |w|
      w.template_id = Template.first.id if w.template.blank?
      w.product = true if w.product.nil?
      w.opera = false if w.opera.nil?
      w.save
    end

  end
end
