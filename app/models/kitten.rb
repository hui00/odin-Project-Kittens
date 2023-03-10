# == Schema Information
#
# Table name: kittens
#
#  id         :bigint           not null, primary key
#  age        :integer
#  cuteness   :integer
#  name       :string
#  softness   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kitten < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true
end
