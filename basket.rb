require 'pry'

class Basket
  def initialize
    @produce = []
  end

  def add_item(**entry)
    # Raise an error if name, flavour and kind
    # keys are not passed

    items = %w[name flavour kind]

    unless items.any? { |key| entry.key? key.to_sym}
      raise "Usage: add_item(name: '...',
                             flavour: '...',
                             kind: '....'
                      )"
    end

    @produce.push(entry)

    puts "Entry #{entry[:name]} created!"
  end

  def change_item(name, entry)
    # Deleting existing record

    item = @produce
           .delete_if { |h| h[:name] == name}
           .first
           .dup

    item = entry

    # Add it to the instance variable
    @produce.push(item)
    @produce.uniq!

    puts "Item #{name} changed!"
  end

  def items
    puts "There are #{@produce.count} number of items in the basket"

    @produce.each do |entry|
      item(entry)
    end
  end

  private

  def item(entry)
    puts "Name: #{entry[:name]}"
    puts "Flavour: #{entry[:flavour]}"
    puts "Kind: #{entry[:kind]}"
  end
end

basket = Basket.new
basket.add_item(
  name: 'apple',
  flavour: "It's a little sour and bitter, but mostly sweet, very juicy",
  kind: 'fruit'
)

basket.add_item(
  name: 'carrot',
  flavour: '',
  kind: 'veggies'
)

basket.change_item(
  'carrot',
  name: 'cucumber',
  flavour: 'slightly bitter with a mild melon aroma and planty flavor',
  kind: 'veggies'
)


basket.items
