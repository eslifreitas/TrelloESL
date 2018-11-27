class Project < ApplicationRecord
    belongs_to :manager, class_name: "Person", foreign_key: :manager_id    
    has_many :histories, dependent: :destroy

    accepts_nested_attributes_for :histories, reject_if: :all_blank, allow_destroy: true

    validates :name, presence: true
end
