class CreateTextStats < ActiveRecord::Migration
  def change
    create_table :text_stats do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
