require 'flammarion'

class StoreItem
    attr_accessor :title,:price
    def initialize(title,price)
        @title,@price = title,price
    end
end

class Book < StoreItem
    # title,price,author name,number of pages,isbn
    attr_accessor :author,:pages_num,:isbn,
    def initialize(title,price,author,pages_num,isbn)
        super(title,price)
        @author,@pages_num,@isbn = author,pages_num,isbn
    end
end

class Magazine < StoreItem
    # title,price,publisher-agent,date
    attr_accessor :agent,:date
    def initialize(title,price,agent,date)
        super(title,price)
        @agent,@date = agent,date
    end
end

class LibraryManager

    attr_accessor :books,:magazines
    def initialize(books,magazines)
        @books,@magazines = books,magazines
    end

    def addBook(book)
        # your code here
    end

    def addMagazine(magazine)
        # your code here
    end

    def booksSortedByPriceDesc
        return @books
    end

    def filterBooksByPriceRange(min,max)
        return @books
    end

    def filterMagazinesByDate(date)
        return @magazines
    end

    def filterMagazinesByPublisher(publisher)
        return @magazines
    end

    def deleteOneItemByTitle(title)
        return @items
    end


    def ui_displayAll
        # your code here
        mainWindow = Flammarion::Engraving.new
        mainWindow.wait_until_closed
    end

    def ui_addItem
        # your code here
        addItemWindow = Flammarion::Engraving.new
        addItemWindow.wait_until_closed
    end

    def ui_addBook
        # your code here
        addBookWindow = Flammarion::Engraving.new
        addBookWindow.wait_until_closed
    end

    def ui_addMagazine
        # your code here
        addMagazineWindow = Flammarion::Engraving.new
        addMagazineWindow.wait_until_closed
    end

    def ui_deleteItem
        # your code here
        deleteItemWindow = Flammarion::Engraving.new
        deleteItemWindow.wait_until_closed
    end

end
