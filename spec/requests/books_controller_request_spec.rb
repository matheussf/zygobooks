require 'rails_helper'

RSpec.describe "BooksControllers", type: :request do
  let!(:books) { create_list(:book, 10) }
  let(:book_build) { build(:book) }
  let(:book) { create(:book) }
  let(:invalid_book) { build(:book, author: nil)}

  before do
    @user = create(:user)
    @admin_user = create(:admin_user)
  end

  describe 'GET #index' do
    it 'return all books' do
      get books_path, as: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).count).to eq(10)
    end
  end

  describe 'GET #new' do
    it 'render new page as admin' do
      sign_in @admin_user
      get new_book_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
      sign_out @admin_user
    end

    it 'fails to render new page as normal user' do
      sign_in @user
      expect {
        get new_book_path
      }.to raise_error(CanCan::AccessDenied)
      sign_out @user
    end

    it 'fails to render new page as guest' do
      expect {
        get new_book_path
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new book as admin user' do
        sign_in @admin_user
        expect {
          post books_url, params: { book: book_build.attributes }
        }.to change(Book, :count).by(1)
        sign_out @admin_user
      end

      it 'fails to create a new book as admin user' do
        sign_in @admin_user
        post books_url, params: { book: invalid_book.attributes }, as: :json
        expect(response).to have_http_status(422)
        sign_out @admin_user
      end

      it 'fails to create a new book as normal user' do
        sign_in @user
        expect {
          post '/books', params: { book: book_build.attributes }
        }.to raise_error(CanCan::AccessDenied)
        sign_out @user
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { create(:book, author: 'New Name') }

      it 'updates the requested book as admin user' do
        sign_in @admin_user
        put book_path(book.id), params: { id: book.id, book: { author: "New Name" } }
        book.reload
        expect(book.attributes).to include('author' => 'New Name')
        sign_out @admin_user
      end

      it 'fails to create a new book as admin user' do
        sign_in @admin_user
        put book_path(book.id), params: { id: book.id, book: { author: nil } }, as: :json
        expect(response).to have_http_status(422)
        sign_out @admin_user
      end

      it 'fails to update the book as normal user' do
        sign_in @user
        expect{
          put book_path(book.id), params: { book: { author: "New Name" } }
        }.to raise_error(CanCan::AccessDenied)
        sign_out @user
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product as admin user' do
      sign_in @admin_user
      expect {
        delete book_path(book.id)
      }.to change(Book, :count).by(0)
      sign_out @admin_user
    end

    it 'unauthorize normal user to destroy book' do
      sign_in @user
      expect {
        delete book_path(book.id)
      }.to raise_error(CanCan::AccessDenied)
      sign_out @user
    end
  end
end
