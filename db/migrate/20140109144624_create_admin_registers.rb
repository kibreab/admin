class CreateAdminRegisters < ActiveRecord::Migration
  def change
    create_table :admin_registers do |t|
      t.string :name
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end
end
