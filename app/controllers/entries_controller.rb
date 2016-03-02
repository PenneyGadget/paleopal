class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create

  end

  def show
    @entry = Entry.find(params[:id])
  end
end
