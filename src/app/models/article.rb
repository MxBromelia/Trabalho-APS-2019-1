class Article < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :users
  has_one_attached :pdf

  alias_attribute :sender, :user
  alias_attribute :proofreaders, :users

  enum status: %i[awaiting pending failed passed]

  after_update :update_status

  def proofreader
    proofreaders.first
  end

  def proofreader=(val)
    if proofreaders.empty?
      proofreaders << val
    else
      proofreaders.first = val
    end
  end

  private

  def update_status
    if awaiting? && proofreaders.present?
      self.status = :pending
    end
  end
end
