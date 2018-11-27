json.extract! task, :id, :description, :done, :history_id, :created_at, :updated_at
json.url task_url(task, format: :json)
