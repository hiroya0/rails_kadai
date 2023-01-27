class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
     if @schedule.save
      flash[:notice] = "予定を新規登録しました"
       redirect_to :schedules
     else
      flash[:notice] = "登録できませんでした"
       render "new"
     end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
      flash[:notice] = "「#{@schedule.id}」の情報を更新しました"
      redirect_to :schdules
    else
      render "edit"
    end
  end

  def destroy
    @schdule = Schedule.find(params[:id])
     @schedule.destroy
     flash[:notice] = "予定を削除しました"
     redirect_to :schedules
  end
end

