var PeopleView = Backbone.View.extend({
  el: '#people',

  events: {
  },

  initialize: function() {
    this.collection = new PeopleCollection();
    this.collection.fetch({
      success: function(){ this.render(); }.bind(this)
    });

    Events.on('person:saved', function(person) {
      this.collection.push(person);
      this.render();
    }.bind(this));

  },

  render: function(){
    this.$el.html(this._table_template({ rows: this._render_rows() }));
  },

  // PRIVATE

  _table_template: _.template("<table><tr><th>First name</th><th>Last name</th></tr><%= rows %></table>"),
  _row_template:   _.template("<tr><td><%= person.get('first_name') %></td><td><%= person.get('last_name') %></td></tr>"),

  _render_rows: function() {
    return this.collection.map(function(person) {
      return this._row_template({ person: person });
    }, this).join('');

  }
});
