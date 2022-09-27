class TasksController < ApplicationController
  grant(
    member: :all,
    manager: :all,
    admin: :all
  )
end
