json.extract! create_book, :id, :title, :description, :image_url, :created_at, :updated_at
json.url create_book_url(create_book, format: :json)
