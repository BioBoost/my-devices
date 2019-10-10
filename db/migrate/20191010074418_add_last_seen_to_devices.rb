class AddLastSeenToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :last_seen, :timestamp
  end
end
