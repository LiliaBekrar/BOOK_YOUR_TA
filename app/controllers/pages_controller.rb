class PagesController < ApplicationController
  def home
  end

  def profil
    @teacher = Teacher.find_by(user_id: current_user.id)
  end
end
