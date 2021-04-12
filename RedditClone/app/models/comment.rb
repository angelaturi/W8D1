class Comment < ApplicationRecord

    validates :content, :post_id, :author_id, presence: true

    belongs_to :post,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :Post

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :parent_comment,
        primary_key: :id,
        foreign_key: :parent_comment_id,
        class_name: :Comment

    has_many :child_comments,
        primary_key: :id,
        foreign_key: :parent_comment_id,
        class_name: :Comment
end
