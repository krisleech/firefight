var AssignPersonView = Backbone.View.extend({
  el: '#assign_person',

  events: {
    'submit form': '_submit'
  },

  initialize: function() {
    // this.model = new Person();
    Events.on('person:saved', function(person) {
      this._updatePersonSelect(person);
    }.bind(this));
  },

  render: function(){
    return this;
  },

  _submit: function(event) {
    event.preventDefault();
  },

  _updatePersonSelect: function(person) {
    $('#assignment_person_id').append(this._select_option_template({ person: person }));
  },

  _select_option_template: _.template("<option value='<%= person.get('id') %>'><%= person.get('full_name') %></option>")
});
