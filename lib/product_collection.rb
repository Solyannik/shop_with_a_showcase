class ProductCollection
  PRODUCT_TYPES = {
    film: {dir: 'films', class: Movie},
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk}
  }

  def self.from_dir(dir_path)
    products = []
    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
      products << product_class.from_file(path)
      end
    end

    new(products)
  end

  def initialize(products = [])
    @products = products
  end

  def to_a
    @products
  end

  def in_stock
    @products.select { |product| product.amount.positive? }
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price.to_i }
    when :amount
      @products.sort_by! { |product| product.amount.to_i }
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end
