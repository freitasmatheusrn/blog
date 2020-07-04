class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable
  has_many :articles
  before_create :add_role_reader

  def add_role_reader
    self.add_role :reader
  end
end
