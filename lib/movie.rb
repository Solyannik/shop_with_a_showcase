class Movie < Product
  attr_accessor :title, :director, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')

    new(
      title: lines[0],
      year: lines[1],
      director: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    %(Фильм "#{title}", #{year}, реж. #{director}, #{super})
  end

  def  without_amount
    %(Фильм "#{title}", #{year}, реж. #{director}, #{price} руб.)
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
