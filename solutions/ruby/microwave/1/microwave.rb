=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  def initialize(seconds)
    @seconds = seconds
  end

  def timer()
    if @seconds < 100
      minutes = @seconds / 60
      seconds = @seconds % 60
    else
      minutes = @seconds / 100
      seconds = @seconds % 100
      minutes = minutes + seconds / 60
      seconds = seconds % 60
    end
    "#{format("%02d", minutes)}:#{format("%02d", seconds)}"
  end
end