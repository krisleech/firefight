def build_person(attrs = {})
  Person.new(attrs.merge(default_person_attrs))
end

def create_person(attrs = {})
  build_person(attrs).tap { |person| PeopleRepo.commit(person) }
end

def default_person_attrs
  {
    first_name: 'Kris',
    last_name: 'Leech'
  }
end
