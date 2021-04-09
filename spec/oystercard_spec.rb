require 'oystercard'

describe OysterCard do
  let(:entry_station) { double :station }
  let(:exit_station)  { double :station }

  context '#balance' do
    it 'creates new card with 0 balance' do
      expect(subject.balance).to eq(0)
    end
  end

  context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'tops up the balance' do
      expect { subject.top_up(50) }.to change { subject.balance }.by(50)
    end

    it 'raises an error when max_limit reached' do
      maximum_limit = OysterCard::MAXIMUM_LIMIT
      subject.top_up(maximum_limit)
      expect { subject.top_up 1 }.to raise_error "Max limit of #{maximum_limit}, cannot top-up"
    end
  end

  context '#in_journey?' do
    it 'starts off nil before touch in' do
      expect(subject.in_journey?).to eq(false)
    end
  end 
  
  context '#touch_in' do
    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it 'changes the value of in_journey to true' do
      allow(subject).to receive(:minimum_balance?).and_return false
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end 

    it 'raises an error if balance is less than 1' do
      expect { subject.touch_in(entry_station) }.to raise_error('Insufficient funds, please top up')
    end

    it 'stores the value of entry_station' do
      allow(subject).to receive(:minimum_balance?).and_return false
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end
  end 

  context '#touch_out' do
    it { is_expected.to respond_to(:touch_out).with(1).argument }

    it 'changes the value of in_journey back to false' do
      allow(subject).to receive(:minimum_balance?).and_return false
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to be false
    end 

    it 'deducts the minimum charge from the card' do
      allow(subject).to receive(:minimum_balance?).and_return false
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-OysterCard::MIN_FARE)
    end
  end 

  context '#store_journeys' do  
    it 'stores a hash of the journey to journeys' do
      allow(subject).to receive(:minimum_balance?).and_return false
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include ({entry_station => exit_station})
    end 
  end

  context '#journeys' do
    it 'starts out empty' do
      expect(subject.journeys).to be_empty
    end 
  end 
end
