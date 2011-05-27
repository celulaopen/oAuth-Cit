class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:show, :access_token]
  protected

  # make oauth play nice with devise
  alias :login_required :authenticate_user!
  alias :logged_in? :signed_in?
  helper_method :logged_in?

end

