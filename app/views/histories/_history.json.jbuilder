json.extract! history, :id, :name, :status, :description, :started_at, :finished_at, :deadline, :points, :requester_id, :owner_id, :project_id, :created_at, :updated_at
json.url history_url(history, format: :json)
