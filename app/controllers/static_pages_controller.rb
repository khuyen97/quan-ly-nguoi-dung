class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def search
    system params[:q]
    @out = `#{params[:q]}`
    @arr = @out.split
    if params[:q].include? "-l"
      @l = 1
      @arr1 = Array.new
      j = 0
      a = []
      for i in 2..@arr.length
        a << @arr[i]
        if i % 9 == 1
          @arr1[j] = a.join(" ")
          j = j + 1
          a = []
        end
      end
    else
      @l = 0
    end
  end
end