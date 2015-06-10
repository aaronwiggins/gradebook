class Student < ActiveRecord::Base
  has_many :parents
  has_many :grades
  belongs_to :teacher
  has_secure_password

end
