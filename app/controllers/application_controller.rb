class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  include Pagy::Backend

  after_action { pagy_headers_merge(@pagy) if @pagy }

  def website
    items = params[:items]
    @item = items
    render template: 'layouts/website'
  end

  def panel
    return redirect_to website_path unless user_signed_in?

    render template: 'layouts/panel'
  end
end
