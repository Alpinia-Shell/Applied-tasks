class Book < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id) 
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%' + content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end
end
