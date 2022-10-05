# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authorize!
  def home; end
end
