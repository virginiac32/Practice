RSPEC

http://www.betterspecs.org/
- `describe “#something” do`
    - Can also use context nested under describe:
    `context “when a student does X” do`
    - When setting up a context, often want to use a before block
        - `before(:each)` runs the block over again for each it block inside the context. There’s also `after(:each)` to use

```ruby
describe Chess do
  let(:board) { Board.new }

  describe '#checkmate?' do
    context 'when in checkmate' do
      before(:each) do
        board.make_move([3, 4], [2, 3])
        board.make_move([1, 2], [4, 5])
        board.make_move([5, 3], [5, 1])
        board.make_move([6, 3], [2, 4])
      end

      it 'should return true' do
        expect(board.checkmate?(:black)).to be true
      end
    end
  end
end
```

- Expect can use an arg or a block
    - Block needed for error checking:
        - `expect { sqrt(-3) }.to raise_error(ArgumentError)`
- RSpec requires that the subject be declared outside of your it blocks
    - `subject(:robot) { Robot.new }`
    - subject accepts a block that constructs the subject. You can do any necessary setup inside the block
        - There aren’t very many cases where you’ll use subject
- let works just like subject, but whereas subject is the focus of the test, let defines helper objects
    - `let(:light_item) { double("light_item", :weight => 1) }`
    - let defines a method (e.g. light_item, max_weight_item) that runs the block provided once for each spec in which it is called.
    - Let doesn’t persist state between different it states

* Mocks/doubles
```ruby
let(:customer) { double("customer") }
subject(:order) { Order.new(customer) }
it "sends email successfully" do
    allow(customer).to receive(:email_address).and_return("ned@appacademy.io")

    expect do
      order.send_confirmation_email
    end.to_not raise_exception
  end
```
    - A method stub stands in for a method
`allow(the_double).to receive(:method_name).and_return(the_return_value_of_method)`
    - One liner: `let(:customer) { double("customer", :email_address => "ned@appacademy.io") }`
- Method expectations
    - if a method you’re testing calls other methods and you want to test that it correctly calls them
    - Expectations get set up before the actual method is called

```ruby
describe Order
  let(:customer) { double('customer') }
  let(:product) { double('product', :cost => 5.99) }
  subject(:order) { Order.new(customer, product) }

  it "subtracts item cost from customer account" do
    expect(customer).to receive(:debit_account).with(5.99)
    order.charge_customer
  end
end
```
Understand RSPEC order of operations https://github.com/appacademy/curriculum/blob/master/ruby/readings/rspec-order.md
