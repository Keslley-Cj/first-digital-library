# frozen_string_literal: true

class Note < EnumerateIt::Base
  associate_values(
    one: "1",
    two: "2",
    three: "3",
    four: "4",
    five: "5"
  )
end
