class User < ApplicationRecord
  attr_accessor :reset_token
  before_save   :downcase_email
  before_create :confirmation_token
  has_many :listings

  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, :message => "A-Z/a-z are the only allowed characters", :on => :create
  validates_length_of :name, :minimum => 4, :maximum => 15, :message => "Name must be at least 4 characters long and not longer than 15 characters"
  has_secure_password
  validates_format_of :phoneNum, :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "should of xxx-xxx-xxxx format"
  #validates_format_of :phoneNum, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed", :on => :create

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def create_reset_digest
    if self.reset_token.blank?
      self.reset_token = SecureRandom.urlsafe_base64.to_s
    end
    update_attribute(:reset_digest,  BCrypt::Password.create(reset_token, cost: 10))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def downcase_email
    self.email = email.downcase
  end

end
