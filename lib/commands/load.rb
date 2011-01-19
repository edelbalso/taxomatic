require 'yaml'

class LoadCommand  < Command

  description "Loads test cases specified in problem pdf"
  usage "taxomatic load <test1|test2|test3> [-hv]"

  def main

    if @params[:args].size != 1
      puts "ERROR: Please specify a test case to load by typing 'taxomatic load <test1|test2|test3>'"
    end

    load_test1 if @params[:args][0] == 'test1'
    load_test2 if @params[:args][0] == 'test2'
    load_test3 if @params[:args][0] == 'test3'

    puts "ERROR: The test case you entered is invalid, please pick between test1, test2 or test3"
  end


private
  def load_test1
    products = []

    products << { :name => 'book', :category => 'BOOKS', :price => '12.49', :imported => false }
    products << { :name => 'music CD', :category => 'DIGITAL_MEDIA', :price => '14.99', :imported => false }
    products << { :name => 'chocolate bar', :category => 'FOOD', :price => '0.85', :imported => false }

    File.open( File.join( Rcli.script_root, 'config', 'products.yml' ), "w+" ) { |f| f.write( products.to_yaml ) }
    puts "Loaded first test case. Type 'taxomatic list' to confirm entries."
    exit
  end

  def load_test2

    products = []

    products << { :name => 'box of chocolates', :category => 'FOOD', :price => '10.00', :imported => true }
    products << { :name => 'bottle of perfume', :category => 'BEAUTY', :price => '47.50', :imported => true }

    File.open( File.join( Rcli.script_root, 'config', 'products.yml' ), "w+" ) { |f| f.write( products.to_yaml ) }
    puts "Loaded second test case. Type 'taxomatic list' to confirm entries and 'taxomatic quote' to get a sample receipt."
    exit
  end

  def load_test3

    products = []

    products << { :name => 'bottle of perfume', :category => 'BEAUTY', :price => '27.99', :imported => true }
    products << { :name => 'bottle of perfume', :category => 'BEAUTY', :price => '18.99', :imported => false }
    products << { :name => 'packet of headache pills', :category => 'MEDICAL', :price => '9.75', :imported => false }
    products << { :name => 'box of chocolates', :category => 'FOOD', :price => '11.25', :imported => true }

    File.open( File.join( Rcli.script_root, 'config', 'products.yml' ), "w+" ) { |f| f.write( products.to_yaml ) }
    puts "Loaded third test case. Type 'taxomatic list' to confirm entries and 'taxomatic quote' to get a sample receipt."
    exit
  end
end


