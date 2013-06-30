class Event < ActiveRecord::Base

  validates_presence_of :organizer_name, :organizer_email, :title
  # validates_format_of :organizer_email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
  validates_format_of :organizer_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  validates_uniqueness_of :title, :case_sensitive => false,
                          :message => "Event title is already taken."
  validate :event_date_cannot_be_in_the_past                        

  def event_date_cannot_be_in_the_past
    errors.add(:date, "event date can't be in the past") if
      !self.date.blank? and self.date < Date.today
  end                          

  # >> p = Person.new
  # => #<Person id: nil, name: nil>
  # >> p.errors
  # => #<ActiveRecord::Errors..., @errors={}>
  # >> p.valid?
  # => false

end
