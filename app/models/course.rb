class Course < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }
  validates :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :when, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :active, inclusion: { in: [ true, false ] }


  # Default values for each month
  attribute :jan, :integer, default: 6
  attribute :feb, :integer, default: 6
  attribute :mar, :integer, default: 6
  attribute :apr, :integer, default: 6
  attribute :may, :integer, default: 6
  attribute :jun, :integer, default: 6
  attribute :jul, :integer, default: 6
  attribute :aug, :integer, default: 6
  attribute :sep, :integer, default: 6
  attribute :oct, :integer, default: 6
  attribute :nov, :integer, default: 6
  attribute :dec, :integer, default: 6
end
