class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :image, styles: { medium: "256x256#", thumb: "50x50#"}, default_url: "/blank_profile.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
end

