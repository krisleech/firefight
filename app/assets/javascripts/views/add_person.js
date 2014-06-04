var AddPersonView = Backbone.View.extend({
  el: '#add_person',

  events: {
    'submit form': '_submit'
  },

  initialize: function() {
    this.model = new Person();
  },

  render: function(){
    return this;
  },

  _submit: function(event) {
    event.preventDefault();
    this.model.set(this._params());
    this.model.save();
  },

  // form params
  _params: function() {
    return {
      'first_name': this._input('first_name'),
      'last_name': this._input('last_name')
    }
  },

  // form input value
  _input: function(id) {
    return this.$('form #person_' + id).val();
  }
});
