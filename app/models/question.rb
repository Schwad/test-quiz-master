class Question < ActiveRecord::Base

  #wysiwyg try this: https://github.com/froala/wysiwyg-rails
  #research capybara testing etc // tomorrow A.M.
  validates_presence_of :question
  validates_presence_of :eanswer

  def is_correct?(submission)

    if is_stringable_num?(submission)
      submission = submission.to_i.humanize
    end

    if is_stringable_num?(self.answer)
      self.answer = self.answer.to_i.humanize
    end

    return self.answer.downcase.delete(" ") == submission.downcase.delete(" ")
  end

  private

  def is_stringable_num?(word)
    word.to_i > 0
  end

end
