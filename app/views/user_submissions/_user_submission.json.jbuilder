json.extract! user_submission, :id, :email, :created_at, :updated_at
json.url user_submission_url(user_submission, format: :json)
