class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :regular_task_categories, class_name: "Categories::RegularTask"
  has_many :regular_tasks, class_name: "Tasks::RegularTask"

end
