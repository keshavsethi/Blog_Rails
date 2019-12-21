class Post < ActiveRecord::Base
    has_many :comments 
    validates :title, presence: true, length: {minimum: 5}
    validates :body, length: {maximum: 300}
end
