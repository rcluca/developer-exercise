const Quotes = Backbone.Collection.extend({
  url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json'
});

const View = Backbone.View.extend({
        el: '#target',
        events:{
            "click #nextPage":"nextPage",
            "click #previousPage":"previousPage"
        },
        template: _.template($("#quotesList").html()),
        initialize: function () {
            this.quotes = new Quotes();
            this.currentPage = 1;
            this.quotesPerPage = 15;
            this.listenTo(this.quotes, 'reset', this.render);
            
            this.quotes.fetch({
                success: () => {
                    this.pagedQuotes = this.pageQuotes(this.currentPage);
                    this.render();
                }
            });
        },
        render: function () {
            this.$el.html(this.template({
                quotes: this.pagedQuotes.toJSON()
            }));
            return this;
        },
        pageQuotes(page){
            if (this.quotes.length <= this.quotesPerPage)
                return this.quotes;

            const fromQuote = page * this.quotesPerPage - this.quotesPerPage;

            return new Quotes(_.chain(this.quotes.models).rest(fromQuote).first(this.quotesPerPage).value());
        },
        nextPage(){
            const fromQuote = (this.currentPage + 1) * this.quotesPerPage - this.quotesPerPage;
            if (fromQuote <= this.quotes.length){
                this.currentPage++;
                this.pagedQuotes = this.pageQuotes(this.currentPage);
                this.render();            
            }
        },
        previousPage(){
            if (this.currentPage >= 2){
                this.currentPage--;
                this.pagedQuotes = this.pageQuotes(this.currentPage);
                this.render();            
            }
        }        
    });

const view = new View();