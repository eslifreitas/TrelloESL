class Task < ApplicationRecord

    belongs_to :history, class_name: "History", foreign_key: :history_id

end
