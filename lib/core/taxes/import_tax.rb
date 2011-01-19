module Taxes
  module ImportTax

    TAX_EXEMPT_CATEGORIES = %w{ }

    def import_tax
      if !imported
        0.00
      else
        tax_rate = 5 # in percentage, as per requirements
        ( price.to_f * tax_rate.to_f ) / 100.to_f
      end
    end
 
  end
end

