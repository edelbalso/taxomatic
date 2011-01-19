require File.join( Rcli.script_root,'lib','core','nickel_rounding.rb' )
require File.join( Rcli.script_root,'lib','core','product.rb' )

class ShoppingCart
  # constructor expects an array of hashes with the following 
  # properties per-product:
  #    :name      (String)
  #    :category  (String, any of: BOOKS FOOD DIGITAL_MEDIA BEAUTY MEDICAL )
  #    :price     (Float)
  #    :imported  (Boolean)
  def initialize(products = nil)
    @products = []

    # store running totals in instance vars
    @subtotal     = 0.00
    @sales_taxes  = 0.00
    @import_taxes = 0.00

    products.each do |p|
      product = Product.new(p)
      @products << product

      puts "Adding #{product.price.to_f} to subtotal for #{product.name}" if $verbose
      @subtotal += product.price.to_f
      puts "Adding sales tax of #{product.sales_tax.round_up_to_nickel}" if $verbose
      @sales_taxes += product.sales_tax.round_up_to_nickel
      puts "Adding import tax of #{product.import_tax.round_up_to_nickel}" if $verbose
      @import_taxes += product.import_tax.round_up_to_nickel

    end
  end

  def display_items
    @products.each do |p|
      puts "#{p.formatted_name}: %.2f" % [p.price.to_f + p.sales_tax.to_f.round_up_to_nickel + p.import_tax.to_f.round_up_to_nickel]
    end
  end

  def display_taxes
    puts "Sales Tax: %.2f" % [@sales_taxes + @import_taxes] if @sales_taxes > 0.009 || @import_taxes > 0.009
  end

  def display_total
    puts "Total: %.2f" % [@subtotal + @sales_taxes + @import_taxes]

  end
end
