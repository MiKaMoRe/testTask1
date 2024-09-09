class CreateUsersSkillsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :skills do |t|
      # t.index [:user_id, :skill_id]
      t.index [:skill_id, :user_id], unique: true
    end
  end
end
