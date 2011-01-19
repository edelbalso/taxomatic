module Taxes
  module SalesTax

    TAX_EXEMPT_CATEGORIES = %w{ BOOKS FOOD MEDICAL }

    def sales_tax
      if Taxes::SalesTax::TAX_EXEMPT_CATEGORIES.include? category
        0.00
      else
        tax_rate = 10 # in percentage, as per requirements
        ( price.to_f * tax_rate.to_f ) / 100.to_f
      end
    end
  end
end
