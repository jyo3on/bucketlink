class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|

      t.timestamps
    end
  end
end
