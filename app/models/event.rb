class Event < ApplicationRecord
  belongs_to :user

  include AASM

    aasm do
      state :created, initial: true
      state :deleted
      state :finished
      state :assigned
      state :update_finisher
      state :update_deadline
      state :commented

      event :create_todo! do
        transitions from: :created, to: :created
      end

      event :destroy_todo! do
        transitions from: :created, to: :deleted
      end

      event :finish_todo! do
        transitions from: :created,     to: :finished
      end

      event :update_finisher! do
        transitions from: :created,      to: :update_finisher
      end

      event :update_deadline! do
        transitions from: :update_finisher,      to: :update_deadline
      end

      event :comment_todo do
        transitions from: :created, to: :commented
      end
    end

end
