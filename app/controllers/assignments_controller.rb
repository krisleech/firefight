class AssignmentsController < ApplicationController
  def create
    @assignment = Assignment.new(assignment_params)
    AssignmentRepo.commit(@assignment) if @assignment.valid?
  end

  private

  def assignment_params
    params[:assignment]
  end
end
