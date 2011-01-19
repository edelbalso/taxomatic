class ClearCommand  < Command
  
  description "Clears the shopping cart and starts over"
  usage "taxomatic clear [-hv]"
  
  def main
    File.open( File.join( Rcli.script_root, 'config', 'products.yml' ), "w+" ) { |f| f.write( [].to_yaml ) }
  end


end


