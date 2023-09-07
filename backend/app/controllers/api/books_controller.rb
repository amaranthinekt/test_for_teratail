class Api::BooksController < ApplicationController
    def index
        books = Book.all
    
        render json: books
    
        # 質問主さんの書き方の場合、フロント側はbooks.value = res.data.bookで受け取る
        # render json: {book: books}
      end
    
      def show
        book = Book.find(params[:id])
        render json: book
      end
end
