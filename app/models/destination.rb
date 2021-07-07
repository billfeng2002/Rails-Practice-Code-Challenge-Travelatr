class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        self.posts.order(likes: :desc).first
    end

    def average_age
        self.bloggers.uniq.sum{|blogger| blogger.age}.to_f/self.bloggers.uniq.count
    end

    def recent_posts
        self.posts.order(created_at: :desc).limit(5)
    end
end
