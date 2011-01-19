require File.join( Rcli.script_root,'lib','core','shopping_cart.rb' )

class QuoteCommand  < Command

  description "Calculates prices and displays sample itemized receipt including tax totals"
  usage "taxomatic quote [-hv]"

  def main
    puts "Loading products..." if $verbose

    cart = ShoppingCart.new(YAML::load_file( File.join( Rcli.script_root, 'config','products.yml' ) ))

    cart.display_items
    cart.display_taxes
    cart.display_total
  end


end
