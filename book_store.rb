require 'flammarion'

class StoreItem
    attr_accessor :title,:price
    def initialize(title,price)
        @title,@price = title,price
    end
end

class Book < StoreItem
    # title,price,author name,number of pages,isbn
    attr_accessor :author,:pages_num,:isbn
    def initialize(title,price,author,pages_num,isbn)
        super(title,price)
        @author,@pages_num,@isbn = author,pages_num,isbn
    end

    def to_s
        return [@title,@price,@author,@pages_num,@isbn].join(",")
    end

    def self.parse(inputString)
        return self.new(*inputString.split(","))
    end

end

class Magazine < StoreItem
    # title,price,publisher-agent,date
    attr_accessor :agent,:date
    def initialize(title,price,agent,date)
        super(title,price)
        @agent,@date = agent,date
    end

    def to_s
        return [@title,@price,@agent,@date].join(",")
    end

    def self.parse(inputString)
        return self.new(*inputString.split(","))
    end
end

class LibraryManager

    def initialize(booksFilePath,magazinesFilePath)
        @booksFilePath,@magazinesFilePath = booksFilePath,magazinesFilePath
        self.readDataFromFiles
        self.ui_displayAll
    end

    ######################## file system functions ##############################
    def getArrayOfLinesFromFile(fileName)
        return IO.readlines(fileName)
    end

    def readDataFromFiles
        booksFileLinesArray = self.getArrayOfLinesFromFile(@booksFilePath).filter{|line| !line.chomp.empty?}
        @books = booksFileLinesArray.map{|line| Book.parse(line.chomp)}
        magazinesFileLinesArray = self.getArrayOfLinesFromFile(@magazinesFilePath).filter{|line| !line.chomp.empty?}
        @magazines = magazinesFileLinesArray.map{|line| Magazine.parse(line.chomp)}
    end

    def updateFile(fileName,content)
        IO.write(fileName,content)
    end


    def updateBooksFile
        content = @books.map{|book| book.to_s}.join("\n")
        self.updateFile(@booksFilePath,content)
    end

    def updateMagazinesFile
        content = @magazines.map{|magazine| magazine.to_s}.join("\n")
        self.updateFile(@magazinesFilePath,content)
    end
    #############################################################################

    def setBooks(inputBooks)
        @books = inputBooks
        self.updateBooksFile
    end

    def setMagazines(Magazines)
        @Magazines = Magazines
        self.updateBooksFile
    end
    def magazines=(inputMagazines)
        @magazines = inputMagazines
        self.updateMagazinesFile
    end

    def addBook(book)
        # your code here
        self.setBooks(@books.push(book))
    end

    def addMagazine(magazine)
        # your code here
        self.setmagazines(@magazines.push(magazine))
    end

    def booksSortedByPriceDesc
        #return  @books.sort! {|x, y| y <=> x}
        return @books.sort_by { |book| -book[:price] }
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
        @mainWindow = Flammarion::Engraving.new
        @mainWindow.orientation = :horizontal

        @mainWindow.subpane("books").button("Add Book"){self.ui_addBook}
        @mainWindow.subpane("books").button("Delete Book"){self.ui_deleteBook}
        @mainWindow.subpane("books").puts("-----------------------------")
        @mainWindow.subpane("books").puts("------------books------------")
        @mainWindow.subpane("books").puts("-----------------------------")
        @mainWindow.subpane("books").puts(" ")
        @mainWindow.subpane("books").subpane("books_list")
        @books.each do |item|
            @mainWindow.subpane("books").subpane("books_list").puts(item)
        end

        @mainWindow.pane("magazines").button("Add Magazine"){self.ui_addMagazine}
        @mainWindow.pane("magazines").button("Delete Magazine"){self.ui_deleteMagazine}
        @mainWindow.pane("magazines").puts("-----------------------------")
        @mainWindow.pane("magazines").puts("----------magazines----------")
        @mainWindow.pane("magazines").puts("-----------------------------")
        @mainWindow.pane("magazines").puts(" ")
        @mainWindow.pane("magazines").subpane("magazines_list")
        @magazines.each do |item|
            @mainWindow.pane("magazines").subpane("magazines_list").puts(item)
        end

        @mainWindow.wait_until_closed
    end

    def ui_refreshBooks
        @mainWindow.subpane("books").subpane("books_list").replace("")
        @books.each do |item|
            @mainWindow.subpane("books").subpane("books_list").puts(item)
        end
    end

    def ui_refreshMagazines
        @mainWindow.pane("magazines").subpane("magazines_list").replace("")
        @magazines.each do |item|
            @mainWindow.pane("magazines").subpane("magazines_list").puts(item)
        end
    end

    def isValidString(str)
        !( (str.empty?) || (str.match?(/\\|,/)) )
    end
    
    def ui_addBook
        addBookWindow = Flammarion::Engraving.new
        addBookWindow.subpane("message").puts("")
        titleInput = addBookWindow.input("Book title") # check empty
        priceInput = addBookWindow.input("Book price")
        authorInput = addBookWindow.input("Book author")
        pagesInput = addBookWindow.input("Book pages")
        isbnInput = addBookWindow.input("Book isbn")
        addBookWindow.button("Save"){
            title = titleInput.to_s
            price = priceInput.to_s
            author = authorInput.to_s
            pages = pagesInput.to_s
            isbn = isbnInput.to_s

            if( title.empty? || price.empty? || author.empty? || pages.empty? || isbn.empty? )
                addBookWindow.subpane("message").replace("")
                addBookWindow.subpane("message").puts("please fill all the fields")
            else 
                if( title.match?(/\\|,/) || price.match?(/\\|,/) || author.match?(/\\|,/) || pages.match?(/\\|,/) || isbn.match?(/\\|,/) )

                    addBookWindow.subpane("message").replace("")
                    addBookWindow.subpane("message").puts("invalid input (comma and backslash are not allowed)")

                else
                    book = Book.new(title,price,author,pages,isbn)
                    self.addBook(book)
                    self.ui_refreshBooks
                addBookWindow.subpane("message").replace("")
                    addBookWindow.subpane("message").puts("successfully saved")
                end

            end
        }
        # if()
        #     addBookWindow.button("Save"){@books.push(Book.new(title,price,author,pages,isbn))}
        # end
        # self.ui_refreshBooks
        addBookWindow.wait_until_closed
    end

    def ui_addMagazine
        addMagazineWindow = Flammarion::Engraving.new
        addMagazineWindow.subpane("message").puts("")
        titleInput = addMagazineWindow.input("Magazine title")
        priceInput = addMagazineWindow.input("Magazine price")
        publisherInput = addMagazineWindow.input("Magazine publisher")
        dateInput = addMagazineWindow.input("Magazine date")
        addMagazineWindow.button("Save"){
            title = titleInput.to_s
            price = priceInput.to_s
            publisher = publisherInput.to_s
            date = dateInput.to_s

            if( title.empty? || price.empty? || publisher.empty? || date.empty? )
                addMagazineWindow.subpane("message").replace("")
                addMagazineWindow.subpane("message").puts("please fill all the fields")
            else 
                if( title.match?(/\\|,/) || price.match?(/\\|,/) || publisher.match?(/\\|,/) || date.match?(/\\|,/))

                    addMagazineWindow.subpane("message").replace("")
                    addMagazineWindow.subpane("message").puts("invalid input (comma and backslash are not allowed)")

                else
                    magazine = Magazine.new(title,price,publisher,date)
                    self.addMagazine(magazine)
                    self.ui_refreshMagazines
                    addMagazineWindow.subpane("message").replace("")
                    addMagazineWindow.subpane("message").puts("successfully saved")
                end

            end
        }


        addMagazineWindow.wait_until_closed
    end

    def ui_deleteBook
        deleteItemWindow = Flammarion::Engraving.new
        bookTitle = deleteItemWindow.input("Book Title")
        deleteItemWindow.button("Delete")
        deleteItemWindow.wait_until_closed
    end

    def ui_deleteMagazine
        deleteItemWindow = Flammarion::Engraving.new
        magazineTitle = deleteItemWindow.input("Magazine Title")
        deleteItemWindow.button("Delete")
        deleteItemWindow.wait_until_closed
    end

end


booksFilePath = "Book.txt"
magazinesFilePath = "Magazine.txt"

#get books and magazines
books = []
magazines = []

lib = LibraryManager.new(booksFilePath,magazinesFilePath)
