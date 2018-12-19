class History < ApplicationRecord
    belongs_to :requester, class_name: "Person", foreign_key: :requester_id
    belongs_to :owner, class_name: "Person", foreign_key: :owner_id
    belongs_to :project, class_name: "Project", foreign_key: :project_id

    has_many :tasks, dependent: :destroy
    
    validates_with HistoryValidator

    def short_time
        time.to_s(:short)
    end
    
end
