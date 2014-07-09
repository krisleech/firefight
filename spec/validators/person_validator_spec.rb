uses :repos
require_validators :person_validator

describe PersonValidator do
  describe '#call' do
    it 'returns false when person does not have unique id' do
      person = double('Person', id: '1234', valid?: true)

      validator = PersonValidator.new(double('PersonRepo', find: [person]))

      expect(validator.valid?(person)).to be_falsey
    end
  end
end
