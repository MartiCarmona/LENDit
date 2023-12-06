class FaqController < ApplicationController
  def index
    @user = current_user

    render layout: "with_sidebar"
  end
end
