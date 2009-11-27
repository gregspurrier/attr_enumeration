ActiveRecord::Schema.define do
  create_table :test_objects, :force => true do |t|
    t.string :color
    t.integer :level
  end
end
