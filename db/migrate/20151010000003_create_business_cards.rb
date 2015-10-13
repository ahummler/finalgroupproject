class CreateBusinessCards < ActiveRecord::Migration
  def change
    create_table :business_cards do |t|
    	t.string :company_name
    	t.string :web_url
    	t.string :full_name
    	t.string :job_title
    	t.string :phone
    	t.string :email
      t.timestamps null: false
    end
  end
end

