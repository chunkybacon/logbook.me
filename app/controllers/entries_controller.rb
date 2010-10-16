class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    @facilities = @entries.collect(&:facility).uniq
  end
end
