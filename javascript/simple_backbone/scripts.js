const Quotes = Backbone.Collection.extend({
  url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json'
});

const View = Backbone.View.extend({
        el: '#target',
        template: _.template($("#quotesList").html()),
        initialize: function () {
            this.coll = new Quotes()
            this.listenTo(this.coll, 'reset', this.render);
            
            this.coll.fetch({ success: () => { this.render() ; } });
        },
        render: function () {
            this.$el.html(this.template({ quotes: this.coll.toJSON() }));
            return this;
        }
    });

const view = new View();