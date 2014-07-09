require_repos :people_repo

describe PeopleRepo do
  after(:each) { PeopleRepo.delete_all }

  it '#select finds matching people' do
    person = build_person(first_name: 'Foo')
    PeopleRepo.commit(person)
    3.times { PeopleRepo.commit(random_person) }

    people = PeopleRepo.select { |p| p.first_name == 'Foo' }
    expect(people).to eq [person]
  end

  it '#find_by_id finds person with given id' do
    person = build_person(first_name: 'Foo', last_name: 'Face')
    PeopleRepo.commit(person)
    PeopleRepo.commit(random_person)

    expect(PeopleRepo.find_by_id(person.id)).to eq person
  end

  def build_person(attrs = {})
    attrs = { id: SecureRandom.uuid, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }.merge(attrs)
    double('Person', attrs)
  end

  def random_person
    build_person
  end
end
