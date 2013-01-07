class CreateBustimes < ActiveRecord::Migration
  def change
    create_table :bustimes do |t|

      t.timestamps
    end
  end
end
