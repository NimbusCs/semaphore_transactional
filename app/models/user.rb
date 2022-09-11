# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :accounts

  def as_json(options={:except => [:created_at, :updated_at, :id, :provider, :email, :uid, :allow_password_change, :name, :image]})
    super(options.merge!(methods: [:accounts]))
  end

end
