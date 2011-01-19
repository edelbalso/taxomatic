class ListCommand  < Command

  description "Table-formatted list of products without calculated totals"
  usage "taxomatic list [-hv]"

  def main

    products = YAML::load_file( File.join( Rcli.script_root, 'config','products.yml' ) )

    header_formatting = "| %-30s | %-13s | %9s | %-8s |"
    row_formatting    = "| %-30s | %-13s | $ %7.2f | %-8s |"

    header = header_formatting % ['Product Name','Category','Price','Imported']

    puts "-" * header.size
    puts header
    puts "-" * header.size

    if products.size == 0
        puts "| %-#{header.size - 4}s |" % ['Your cart is empty']
    else
      products.each do |p|
        puts row_formatting % [p[:name],p[:category],p[:price],(p[:imported] ? 'yes' : 'no')]
      end
    end
    puts "-" * header.size
  end


end


