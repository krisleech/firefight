var PeopleView = Backbone.View.extend({
  el: '#people',

  initialize: function() {
    this.collection = new PeopleCollection();
    this.collection.fetch();
    this.collection.bind("change", this.render)
  },

  render: function(){
    this.$el.html('ppppeople');
    // TODO: display collection
  }
});
