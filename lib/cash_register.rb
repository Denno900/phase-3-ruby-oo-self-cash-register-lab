require 'pry'

class CashRegister
    attr_accessor :discount, :total, :register_items

    def initialize(discount = nil)
        @discount = discount
        @register_items = []
        @total = 0
    end

    class RegisterItem 
        attr_accessor :title, :quantity, :price

        def initialize(title, price, quantity)
            self.price = price
            self.quantity = quantity
            self.title = title
        end
    end

    def add_item(title, price ,quantity = 1)
        @total = @total + (price * quantity)
        @register_items.push(RegisterItem.new(title, price, quantity))
    end

    def apply_discount
        if discount == nil
            "There is no discount to apply."
        else
            @total = @total - ((@discount * @total)/100)
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @register_items.map { |item| (1..item.quantity).entries.map { item.title } }.flatten
      end

    def void_last_transaction
        last_transaction = @register_items.pop
        if @register_items.length == 0 
            @total = 0
        else
            @total = @total - last_transaction.price
        end
    end
end

c1 = CashRegister.new

binding.pry