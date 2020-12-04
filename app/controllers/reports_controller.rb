class ReportsController < ApplicationController

  before_action :admin_check, only: [:index, :show]

# 以下管理者用
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

# 以下利用者用
  def new
  	# show.html.erbで値が入った＠orderを受け取り（params）
    @report = Report.new(report_params)
  end

  def complete
  end

  def create
  	# new.html.erbのform_forからここへくる。
    # データを新規登録するためのインスタンス作成
    @report = Report.new(report_params)
    if @report.save
      # 送信完了画面へリダイレクト
      redirect_to report_complete_path
    else
      render :new
    end
  end

private
  def report_params
    params.require(:report).permit(:user_id, :fire_engine_id, :title, :caption)
  end


  def admin_check
    # ログインユーザー且つ管理者の場合以外はtopへ飛ばす
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end

  end
end