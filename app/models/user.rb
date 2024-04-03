class User < ApplicationRecord
  before_validation :downcase_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_and_belongs_to_many :following, class_name: "User", join_table: "relationships", foreign_key: "follower_id", association_foreign_key: "followed_id"
  has_and_belongs_to_many :followers, class_name: "User", join_table: "relationships", foreign_key: "followed_id", association_foreign_key: "follower_id"

  has_one_attached :avatar
  validates :username, uniqueness: { case_sensitive: false }, if: :username_changed?

  private

  def downcase_username
    self.username = username.downcase if username.present?
  end
end
