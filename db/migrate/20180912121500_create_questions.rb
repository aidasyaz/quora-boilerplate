class CreateQuestions < ActiveRecord::Migration[5.0]

  def change
  	create_table :questions do |t|
	  	t.string :title ,null: false
	  	t.string :details,null: false
	  	t.belongs_to :user,null: false
	  	t.timestamps
	end
  end

end
