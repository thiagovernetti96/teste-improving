class CreateOctoEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :octo_events do |t|

      t.timestamps
    end
  end
end
