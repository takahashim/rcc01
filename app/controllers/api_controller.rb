class ApiController < ApplicationController
  def repo
    log.warn params.inspect
  end
end
