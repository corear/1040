def new
  @survey = Quiz.new
  3.times do
    question = @survey.questions.build
    4.times { question.answers.build }
  end
end