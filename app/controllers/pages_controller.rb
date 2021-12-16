class PagesController < ApplicationController
  def home
    @cities = Teacher.all.map { |teacher| teacher.city_name }.uniq
  end

  def profil
  unless Teacher.find_by(user_id: current_user.id).nil?
    @teacher = Teacher.find_by(user_id: current_user.id)
  else
    @teacher = nil
  end
  end
end
