const Quotes = Backbone.Collection.extend({
  url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json'
});

var items = [
        {name:"Item 1"},
        {name:"Item 2"},
        {name:"Item 3"}
];

const template = $("#quotesList").html();
$("#target").html(_.template(template)({items:items}));