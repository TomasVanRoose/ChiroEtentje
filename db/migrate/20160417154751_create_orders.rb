class CreateOrders < ActiveRecord::Migration
  def change

    create_table :orders do |t|

		t.belongs_to :group, index:true

		t.timestamps null: false
    end

  end
end
