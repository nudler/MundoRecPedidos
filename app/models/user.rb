class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :remember_me, :isadmin

  validates_presence_of :name, :email
  validates_uniqueness_of :email, :case_sensitive => false

  after_create :welcome_message

  has_many :pedidos

  def initialize(attributes=nil)
    attr_with_defaults = {:password => generate_activation_code(8)}.merge(attributes)
    super(attr_with_defaults)
  end

  # Generates a random string from a set of easily readable characters
  def generate_activation_code(size = 8)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

  private

  def welcome_message
    UserMailer.welcome_email(self).deliver

  end

end

