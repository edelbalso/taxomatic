require File.join( Rcli.script_root,'lib','core','taxes','import_tax.rb' )
require File.join( Rcli.script_root,'lib','core','taxes','sales_tax.rb')

class Product

  include Taxes::SalesTax
  include Taxes::ImportTax

  ALLOWED_CATEGORIES = %w{ BOOKS FOOD DIGITAL_MEDIA BEAUTY MEDICAL }

  attr_reader :name, :category, :price, :imported

  # constructor expects a has with the following properties per-product:
  #    :name      (String)
  #    :category  (String, any of: BOOKS FOOD DIGITAL_MEDIA BEAUTY MEDICAL )
  #    :price     (Float)
  #    :imported  (Boolean)
  def initialize args
    args.each do |key,value|
      instance_variable_set("@#{key}", value) unless value.nil?
      if key == 'category' && !Products::ALLOWED_CATEGORIES.include?( value )
        raise InvalidProductCategoryException, "That product category doesn't exist"
      end
    end
  end

  def formatted_name
    fn = name
    fn = 'imported ' + fn if imported
    fn = '1 ' + fn
  end
end
