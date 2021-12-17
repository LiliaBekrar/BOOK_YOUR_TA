class PagesController < ApplicationController

  def profil
    unless Teacher.find_by(user_id: current_user.id).nil?
      @teacher = Teacher.find_by(user_id: current_user.id)
    else
      @teacher = nil
    end
  end
end
