class TopicsController < ApplicationController

  def index
    Topics::DisplayTopics.new.call do |response|
      response.success { @topics = response.context }
    end
  end

end
