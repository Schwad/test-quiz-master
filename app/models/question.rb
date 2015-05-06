class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    if submission.is_num?
      submission = submission.to_i.humanize
    end

    if answer.is_num?
      answer = submission.to_i.humanize
    end

    return answer.downcase.delete(" ") == submission.downcase.delete(" ")
  end

  private

  def is_num?
    self.to_i > 0
  end

end
