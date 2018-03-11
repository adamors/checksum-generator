# Refinements for the String class
module StringRefinements
  refine String do
    def vowel?
      match?(/[aeiou]/i)
    end

    def upper_case?
      match?(/[[:upper:]]/)
    end

    def word_count
      split.count
    end
  end
end
