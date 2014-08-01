class User
  include Mongoid::Document
  has_many :photos
  has_many :comments
  has_many :albums

  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key[0]["$oid"])
      record if record && record.authenticatable_salt == salt
    end
  end

  # devise helps with user authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # fields allowed in mongodb
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  # Recoverable fields
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  # Rememberable fields
  field :remember_created_at, type: Time

  # Trackable fields
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, case_sensitive: false
end
