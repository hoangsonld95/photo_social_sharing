class Test
  attr_accessor :name, :email

  def init(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def format
    "#{@name} #{@email}"
  end

end
