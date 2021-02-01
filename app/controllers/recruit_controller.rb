class RecruitController < ApplicationController

  def index
    @recruits = Character.all
  end

  def show
    @recruit = Character.find(params[:id])
    recruit_service = BadgeService.new.post_badge_cred(@recruit.first_name, @recruit.last_name, @recruit.email)
    @recruit.update(certified: :true)
    flash[:success] = "#{@recruit.last_name} Certified!"
    redirect_to '/recruits'
  end

end
