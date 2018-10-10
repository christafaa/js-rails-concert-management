module ApplicationHelper
  def find_user(id)
    User.find(id)
  end

  def display_user(id)
    find_user(id).username
  end
end
