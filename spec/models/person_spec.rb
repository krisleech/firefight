require_models :person

describe Person do
  it 'is initialized with an id' do
    expect(subject.id).to be_present
  end
end
