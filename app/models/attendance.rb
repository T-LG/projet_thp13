class Attendance < ApplicationRecord
	after_create :event_participation_email
	belongs_to :user, required: false
    belongs_to :event, required: false

    def event_participation_email
		UserMailer.event_participation_email(self.user, self.event).deliver_now
	end
end