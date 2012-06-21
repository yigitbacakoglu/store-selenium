class CreateCatogaries < ActiveRecord::Migration
  def change
    create_table :catogaries do |t|
      t.string :name

      t.timestamps
    end
  end
end
