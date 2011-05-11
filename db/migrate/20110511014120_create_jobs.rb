class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :customer_id
      t.date :deadline
      t.boolean :completed
      t.integer :page_count
      t.string :price_per_page
      t.boolean :paid
      t.string :input_file
      t.string :output_file

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
