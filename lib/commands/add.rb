require 'yaml'

class AddCommand  < Command

  description "Interactively adds a product to the shopping cart"
  usage "taxomatic add [-hv]"

  def main

    # Load previously entered products
    products = YAML::load_file( File.join( Rcli.script_root, 'config','products.yml' ) )
    product = {}

    print "product name: " 
    product[:name] = gets.strip
    print "product category: "
    product[:category] = gets.strip
    print "product price: $"
    product[:price] = gets.strip
    print "imported? [y/n] "
    product[:imported] = ( gets.strip.upcase == 'Y' ? true : false ) 

    puts "Product '#{product[:name]}' added to shopping cart."

    products << product

    File.open( File.join( Rcli.script_root, 'config', 'products.yml' ), "w+" ) { |f| f.write( products.to_yaml ) }
  end


end

