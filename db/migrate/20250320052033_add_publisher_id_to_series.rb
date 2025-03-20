class AddPublisherIdToSeries < ActiveRecord::Migration[7.2]
  def change
    add_reference :series, :publisher, null: false, foreign_key: true
  end
end
