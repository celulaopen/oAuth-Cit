class User < ActiveRecord::Base
  devise :ldap_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :client_applications
  has_many :tokens, :class_name => "OauthToken", :order => "authorized_at desc", :include => [:client_application]

  attr_accessible :user, :email, :password, :password_confirmation, :remember_me
end

