class Array
    def where(args)
        filteredItems = []
        self.each do |arrItem|
            should_include = true
            args.each do |key, value|
                if value.is_a? Numeric
                    if (arrItem[key] != value)
                        should_include = false
                        break
                    end
                else
                    if (arrItem[key].index(value).nil?)
                        should_include = false
                        break
                    end
                end
            end
            if (should_include)
                filteredItems << arrItem
            end
        end
        filteredItems
    end
end