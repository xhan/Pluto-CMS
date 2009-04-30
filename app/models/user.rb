# == Schema Information
# Schema version: 20090430105951
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  login                     :string(40)
#  email                     :string(40)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  remember_token            :string(40)
#  expires_at                :datetime
#  remember_token_expires_at :datetime
#  created_at                :datetime
#  updated_at                :datetime
#

require "digest/sha1"

class User < ActiveRecord::Base
  
  # attr_accessor :password,:email,:password_confirmation,:login,:expires_at 
  attr_accessor :password_confirmation, :password
  validates_presence_of :login
  validates_presence_of :email
  validates_confirmation_of :password, :if => :password_required?, :message => "Password should match confirmation"
  validates_presence_of :password,:if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_uniqueness_of :login
  validates_uniqueness_of :email, :on => :create, :message => "Email has been taken!"
  validates_length_of :login, :within => 3..20
  validates_length_of :password, :within => 4..40, :if => :password_required?
  validates_length_of :password_confirmation, :within => 4..40, :if => :password_required?
  validates_format_of :email, :with => /^([^@\s]{1}+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :on => :create, :message=>"Invalid email address."
  
  before_save :encrypt_password
  after_save  :handle_after_save
                        
  has_one :forum_profile, :class_name => "ForumUserProfile"
  
  # => Class methods -------------------------------------------------
  def self.authenticate login,pass
    u = find_by_login(login)
    u && u.authenticated?(pass) ? u : nil
  end
  
  def self.encrypt pass, salt
    Digest::SHA1.hexdigest("--#{salt}--#{pass}pluto_cms--")
  end
  
  # => instance methods -------------------------------------------------
  
  def handle_after_save
    create_forum_profile(:is_active  => true)
  end
  
  def authenticated? pass
    crypted_password == User.encrypt(pass,self.salt)
  end
    
  def remember_me
    self.remember_token_expires_at = 10.years.from_now
  end  

  # return true if user has been expired
  def expired?
    expires_at && expires_at <= Time.now
  end
  
  def enable
    self.expires_at = nil
  end

  def enable!
    enable
    save!
  end
  
  def disable
    if self.class.count(:conditions => ["expires_at is null and id != ?", id]) > 0
      self.expires_at = Time.now - 1.minutes
    else
      false
    end
  end
  
  def disable!
    unless disable
      raise "You must have one user alive"
    end
    save!
  end
  # => protected methods -------------------------------------------------
  
  protected
  def password_required?
    crypted_password.blank? || !password.blank?
  end
  
  # before save functiion   => encrypt password from user virtual state password
  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
    self.crypted_password = User.encrypt(password,self.salt)
  end
end
