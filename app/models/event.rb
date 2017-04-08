class Event < ApplicationRecord
  belongs_to :user

  include AASM

    aasm do
      state :unfinished, initial: true
      state :paid
      state :shipping
      state :shipped
      state :order_cancelled
      state :good_returned


      event :make_payment do
        transitions from: :order_placed, to: :paid
      end

      event :ship do
        transitions from: :paid,         to: :shipping
      end

      event :deliver do
        transitions from: :shipping,     to: :shipped
      end

      event :return_good do
        transitions from: :shipped,      to: :good_returned
      end

      event :cancel_order do
        transitions from: [:order_placed, :paid], to: :order_cancelled
      end
    end

end
