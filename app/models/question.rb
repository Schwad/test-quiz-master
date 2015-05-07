class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    if is_stringable_num?(submission)
      submission = submission.to_i.humanize
    end

    if is_stringable_num?(self.answer)
      self.answer = submission.to_i.humanize
    end

    return self.answer.downcase.delete(" ") == submission.downcase.delete(" ")
  end

  private

  def is_stringable_num?(word)
    word.to_i > 0
  end

end
