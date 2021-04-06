require 'oystercard'
describe Oystercard do
  oystercard = Oystercard.new
  it { expect(oystercard).to be_an_instance_of(Oystercard) }

  it { expect(subject.balance).to eq (0) }

  describe '#top_up' do
    it 'adds to the balance value' do
      expect { subject.top_up(15) }.to change { subject.balance }.by(15)
    end
    it 'throws an error when balance exceed 90' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1 }.to raise_error "Exceeded maximum amount: £#{max_balance}"
    end
  end 

  describe '#deduct' do
    it 'deducts from the balance value' do
      expect { subject.deduct(15) }.to change { subject.balance }.by(-15)
    end
  end
end 
