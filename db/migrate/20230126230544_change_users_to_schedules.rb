class ChangeUsersToSchedules < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :schedules
  end
end
