class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :name, :state, :owner_id, :participants

    def participants
        object.project_participants.map{ |project_participant| { 
            id: project_participant.id, participant_id: project_participant.participant_id
        }}
    end
end