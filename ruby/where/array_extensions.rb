class Array
    def where(args)
        filteredItems = []
        args.each do |key, value|
            self.each do |arrItem|
                if (arrItem[key].index(value))
                    filteredItems << arrItem
                end
            end
        end
        filteredItems
    end
end