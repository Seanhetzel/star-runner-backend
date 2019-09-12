class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :high_score
      t.string :display_name

      t.timestamps
    end
  end
end
