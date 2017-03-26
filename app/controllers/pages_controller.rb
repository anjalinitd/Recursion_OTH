class PagesController < ApplicationController
before_action :set_auth 



    def leaderboard
      @users= User.all
      @users = @users.all.paginate(page: params[:page], per_page: 3)
      @id=1
    end

	def index

     user=current_user

     if current_user.score==nil
      current_user.score=0
      session[:victor]=0
    end

   if current_user.score>=30
    session[:victor]=1
      redirect_to victory_path
    end
    
    if session[:victor]==0
      my_id = current_user.score/10+1
      @question = Question.find(my_id)
    end

    if params[:answer].present?
      if params[:answer].casecmp(@question.answer)==0
        current_user.score+=10
        user.save!
        if current_user.score>=30
          session[:victor] = 1
          redirect_to victory_path
        else
          my_id=(current_user.score/10)+1
          @question=Question.find(my_id)
          redirect_to explore_path
        end
          
      end
    end

	end

	def home
     user=current_user
  end

   def victory
   end

   def explore 
    if session[:score].nil?
      session[:score]=0
      session[:victor]=0
    end
    if session[:victor]==0
      my_id = session[:score]/10+1
      if session[:score]>=30
          session[:victor] = 1
          redirect_to victory_path
      else
      @question = Question.find(my_id)
    end
    end
  end




    def set_auth
      @auth=session[:omniauth] if session[:omniauth]
    end

    def edit
    @user=current_user
    end

  def update
    @user=current_user

    if @user.update(user_params)
      flash[:notice]="Your Profile was successfully Updated!!"
      redirect_to home_path
    else
      flash[:notice]="Sorry!! Could not save profile!"
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name,:college)
  end

end