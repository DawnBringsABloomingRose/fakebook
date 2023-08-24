json.extract! post, :id, :public_status, :user_id, :text_content, :created_at, :updated_at
json.url post_url(post, format: :json)
