module TestsHelper
    def question
        @question = Question.all
    end
    def anser
        @anser = Anser.all
    end
end
