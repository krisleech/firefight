class DiaryController < ApplicationController
  def show
    @new_person = Person.new
    @people = PeopleRepo.all
    @assignment = Assignment.new
    @slots = Diary.this_month
  end
end
