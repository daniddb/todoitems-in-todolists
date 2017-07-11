json.extract! todoitem, :id, :item_due, :description, :completed, :created_at, :updated_at
json.url todoitem_url(todoitem, format: :json)
