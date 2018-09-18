class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
  belongs_to :group
  has_and_belongs_to_many :groups
  mount_uploader :avatar, AvatarUploader
  before_validation :before_validation
  has_many :workshops

  def before_validation
    self.password = self.identification if self.password.nil? && self.new_record?
  end

  def be_admin
    add_role :admin
  end

  def be_student
    add_role :student
  end

  def be_teacher
    add_role :teacher
  end


end
