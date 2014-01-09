class CreateAdminTasks < ActiveRecord::Migration
  def change
    create_table :admin_tasks do |t|
      t.integer :money
      t.string :company

      t.timestamps
    end
  end
end
