class Todolist < ApplicationRecord
  belongs_to :user, required: false
  has_many :todoitems, dependent: :destroy
end
