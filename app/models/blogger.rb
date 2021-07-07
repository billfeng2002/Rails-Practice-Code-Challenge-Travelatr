class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: {message: "needs to be unique"}
    validates :age, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 150}
    validates :bio, length: {minimum: 30}

    def featured_post
        self.posts.order(likes: :desc).first
    end

    def total_likes
        self.posts.sum{|post| post.likes}
    end
end
