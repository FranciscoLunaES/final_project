# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthorizedPersona::Authorization

  authorize_persona class_name: 'User'
end
