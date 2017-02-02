const Quotes = Backbone.Collection.extend({
  url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json'
});

const View = Backbone.View.extend({
        el: '#target',
        events:{
            "click #nextPage":"nextPage",
            "click #previousPage":"previousPage",
            "click #noThemeFilter":function(){this.filterByTheme()},
            "click #gameThemeFilter": function(){this.filterByTheme("games")},
            "click #movieThemeFilter":function(){this.filterByTheme("movies")}
        },
        template: _.template($("#quotesList").html()),
        initialize: function () {
            this.quotes = new Quotes();
            this.currentPage = 1;
            this.quotesPerPage = 15;
            this.listenTo(this.quotes, 'reset', this.render);
            
            this.quotes.fetch({
                success: () => {
                    this.filteredQuotes = new Quotes(this.quotes.models);
                    this.pagedQuotes = this.pageQuotes(this.filteredQuotes, this.currentPage);
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
        pageQuotes(quotes, page){
            if (quotes.length <= this.quotesPerPage)
                return quotes;

            const fromQuote = page * this.quotesPerPage - this.quotesPerPage;

            return new Quotes(_.chain(quotes.models).rest(fromQuote).first(this.quotesPerPage).value());
        },
        nextPage(){
            const fromQuote = (this.currentPage + 1) * this.quotesPerPage - this.quotesPerPage;
            if (fromQuote <= this.quotes.length){
                this.currentPage++;
                this.pagedQuotes = this.pageQuotes(this.filteredQuotes, this.currentPage);
                this.render();            
            }
        },
        previousPage(){
            if (this.currentPage >= 2){
                this.currentPage--;
                this.pagedQuotes = this.pageQuotes(this.filteredQuotes, this.currentPage);
                this.render();            
            }
        },
        filterByTheme(theme){
            this.filteredQuotes = this.quotes;
            if (theme){
                this.filteredQuotes = new Quotes(this.quotes.where({"theme": theme}));
            }
            
            this.pagedQuotes = this.pageQuotes(this.filteredQuotes, this.currentPage);
            this.render();            
        }
    });

const view = new View();