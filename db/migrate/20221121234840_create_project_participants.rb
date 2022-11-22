class CreateProjectParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :project_participants do |t|
      t.references :project, index: true, foreign_key: true
      t.string :participant_id
      t.timestamps
    end
  end
end
