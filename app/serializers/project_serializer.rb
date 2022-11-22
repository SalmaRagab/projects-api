class ProjectSerializer < ActiveModel::Serializer
    attributes :name, :state, :owner_id, :participants

    def participants
        object.project_participants.map(&:participant_id)
    end
end