class CalendarEventPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present?.user
  end
 
  def destroy?
    return true if user.present? && user == calendar_event.user
  end
 
  private
 
    def calendar_event
      record
    end
end
