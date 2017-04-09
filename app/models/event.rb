class Event < ApplicationRecord
  belongs_to :user

  include AASM

    aasm do
      state :created, initial: true
      state :deleted
      state :finished
      state :assigned
      state :updated
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

      event :update_todo! do
        transitions from: :created,      to: :updated
      end

      event :comment_todo do
        transitions from: :created, to: :commented
      end
    end

end
