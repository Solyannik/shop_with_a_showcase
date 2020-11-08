class Disk < Product
  attr_accessor :title, :genre, :year, :singer

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')

    new(
      title: lines[0],
      singer: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @year = params[:year]
    @singer = params[:singer]
  end

  def to_s
    %(Альбом #{title} - "#{singer}", #{genre}, #{year}, #{super})
  end

  def without_amount
    %(Альбом #{title} - "#{singer}", #{genre}, #{year}, #{price} руб.)
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @genre = params[:genre] if params[:genre]
    @singer = params[:singer] if params[:singer]
  end
end
