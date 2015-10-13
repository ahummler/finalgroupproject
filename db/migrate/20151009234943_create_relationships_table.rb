class CreateRelationshipsTable < ActiveRecord::Migration
  def change
    create_table :relationships_tables do |t|
    	t.integer :potential_contacts_id
    	t.integer :contacts_id
    end
  end
end

