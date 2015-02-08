class TeamsController < ApplicationController
  def index
    traitify = Traitify.new(
      api_host: "https://api.traitify.com",
      api_version: "v1",
      deck_id: "career-deck",
      secret: "blqhh9pa7vbp1cr1050o22og64"
    )
    @assessments = []
    # 10.times{
    #   @assessments << traitify.create_assessment
    # }
    # @assessments.each do |assessment|
    #   assessment_id = assessment.id
    #   p assessment_id
    #   slides = traitify.find_slides(assessment.id)
    #   slides.map! do |slide|
    #     slide.response = (rand(0..1) == 0) 
    #     slide.time_taken = 10
    #     traitify.update_slide(assessment_id, slide)
    #     slide
    #   end
    # end
    assessment_ids = [
      "9ed1f92f-7e51-4d2c-8e78-40fff8b13806",
      "c8390df0-0e01-4fde-814b-d518eda28637",
      "a4e25436-3251-41cd-9494-db3ee644628b",
      "94afb172-27fe-4514-81af-9aa54a967aaa",
      "fcf03b85-6103-4e00-9725-d188d4b083f1",
      "1059ee8b-f4bd-4313-a178-14a702864380",
      "f4ff9c59-00a2-4c5d-b99a-a334f25665ad",
      "d12ecd9b-261d-4254-b512-cd994a2e8d0b",
      "0cbab851-7feb-4176-b229-c009cedac1ee",
      "0fef2f91-3421-4bcd-a04d-cf6754fbfa3a",
    ]
        
    @results = [] 
    assessment_ids.each do |id|
      @results << traitify.find_results(id)
    end
    @members = ["Adam", "Ben", "Charles", "Dan", "Edward", "Fiona", "George", "Henry", "Ira", "John"]
    @scores = []
    @personalities = []
    @results.each do |result|
      person_score = {}
      result.personality_types.each do |type|
        person_score[type.personality_type.name] = type.score
      end
      @personalities << result.personality_types.first.personality_type.name
      @scores << person_score
    end
    
    types = ["Mentor", "Visionary", "Naturalist", "Planner", "Analyzer", "Action-Taker","Inventor"]
    @result_parsed = []
    @scores.each do |score|
      result_tmp = []
      types.each do |type|
        result_tmp << score[type]
      end 
      @result_parsed << result_tmp
    end
  end

end
