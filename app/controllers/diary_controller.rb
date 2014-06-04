class DiaryController < ApplicationController
  def show
    @people = PeopleRepo.all
    @assignment = Assignment.new
    @slots = Diary.this_month
  end
end
