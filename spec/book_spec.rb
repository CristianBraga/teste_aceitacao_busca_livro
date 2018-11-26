Bundler.require :default
require 'spec_helper'
require 'require_all'
require_all 'pages'

describe 'Teste Aceitação', :find_book do
  context 'Book' do
    it 'Case' do
      visit(SubmarinoPage)
      on BookPage do |book_page|
        book_page.each_book
        @isbn_book = book_page.isbn
        @author_book = book_page.author
      end
      visit(AmazonPage)
      on BookPage do |book_page|
        book_page.pesquisa_isbn_amazon @isbn_book
        book_page.link_book_result_amazon
        expect(book_page.label_author_name_amazon).to eq @author_book
      end
      visit(AmericanasPage)
      on BookPage do |book_page|
        book_page.pesquisa_isbn_americanas @isbn_book
        book_page.link_book_result_americanas
        expect(book_page.label_author_name_americanas). to eq @author_book
      end
    end
  end
end