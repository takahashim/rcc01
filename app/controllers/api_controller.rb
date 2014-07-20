class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def repo
    log.warn params.inspect
  end
end
