class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  has_attached_file :image,
  :storage => :cloudinary,
  :path => ':id/:style/:filename',
  :default_url => "/blank_profile.jpg",
  :styles => { medium: "256x256#", thumb: "50x50#"}
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  after_create :welcome_send
  
  def welcome_send
    UserMailer.signup_confirmation(self).deliver
    UserMailer.signup_confirmation_admin(self).deliver
  end
  
  def password_required?
    false
  end

end

