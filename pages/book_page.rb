class BookPage
    include PageObject

    # Submarino ######################################################
    elements :product_names, :h1, css: 'h1.card-product-name'
    span :isbn, css: '#info-section > div:nth-child(2) > section > div > div > div.ColUI-sc-1ey7nd2-0.duTvSh.ViewUI-oocyw8-6.kvewNe > table > tbody > tr:nth-child(6) > td:nth-child(2) > span'
    span :author, css: '#info-section > div:nth-child(2) > section > div > div > div.ColUI-sc-1ey7nd2-0.duTvSh.ViewUI-oocyw8-6.kvewNe > table > tbody > tr:nth-child(3) > td:nth-child(2) > span'

    # Amazon #########################################################
    text_field :campo_search_amazon, id: 'twotabsearchtextbox'
    button :botao_submit_search_amazon, class: 'nav-input'
    link :link_book_result_amazon, css: '#result_0 > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div:nth-child(1) > a'
    element :label_author_name_amazon, css: '#byline > span > a'

    # Americanas #####################################################
    text_field :campo_search_americanas, id: 'h_search-input'
    button :botao_submit_search_americanas, id: 'h_search-btn'
    link :link_book_result_americanas, css: '#content-middle > div:nth-child(4) > div > div > div > div.row.product-grid.no-gutters.main-grid > div > section > a'
    element :label_author_name_americanas, css: '#info-section > div:nth-child(2) > section > div > div > div.ColUI-sc-1ey7nd2-0.duTvSh.ViewUI-oocyw8-6.kvewNe > table > tbody > tr:nth-child(3) > td:nth-child(2) > span'

    def each_book        
        product_names_elements.each do |product|
            if product.text.start_with? "Livro -"
                product.click                
              break
            end
        end
    end

    def pesquisa_isbn_amazon(isbn_book)
        self.campo_search_amazon = isbn_book
        botao_submit_search_amazon
    end

    def pesquisa_isbn_americanas(isbn_book)
        self.campo_search_americanas = isbn_book
        botao_submit_search_americanas
    end    
end