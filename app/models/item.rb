# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(11, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_items_on_name  (name) UNIQUE
#
class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 9_999_999.99 }
end
