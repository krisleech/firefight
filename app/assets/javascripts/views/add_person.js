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

  // PRIVATE

  _submit: function(event) {
    event.preventDefault();
    this.model.save(this._params(), {
      success: function() { this._submit_successful() }.bind(this),
      error:   function() { this._submit_failed() }.bind(this)
    });
  },

  _submit_successful: function() {
    Events.trigger('person:saved', this.model);
    this._notice('Person saved.');
    this._clear_inputs();
  },

  _submit_failed: function() {
    this._notice('Person could not be saved');
  },

  // form params
  _params: function() {
    return {
      'first_name': this._input('first_name'),
      'last_name':  this._input('last_name')
    }
  },

  // form input value
  _input: function(id) {
    return this.$('form #person_' + id).val();
  },

  _notice: function(message) {
    this.$('.notice').html(message)
  },

  _clear_inputs: function() {
    this.$('input[type=text]').val('');
  }
});
