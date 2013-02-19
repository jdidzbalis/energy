class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

validates :first_name, presence: true
validates :last_name, presence: true
validates :profile_name, presence: true, uniqueness: true, format: {
															with: /^[a-zA-Z0-9_-]+$/,
															message: 'must be formatted correctly'
															}
 
has_many :project_fundings

has_many :investments, through: :project_fundings, conditions: {project_fundings: {state:'accepted'} }

has_many :pending_project_fundings, class_name: 'ProjectFundings', foreign_key: :project_id, conditions: {state:'pending'}

has_many :pending_investments, through: :pending_project_fundings, source: :investment

  def full_name
  	first_name + " " + last_name
  end
end
