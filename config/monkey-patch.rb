# I know we hate monkey patching but this is so much easier...
class Integer
  def commas
    stringified = self.to_s
    string = []
    while stringified.length > 2
      string << stringified.slice!(-3, 3)
    end
    string.push(stringified)
    string.reverse.reject(&:empty?).join(",")
  end
end
