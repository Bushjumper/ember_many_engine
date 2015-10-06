require 'json'

class Author < ActiveRecord::Base
  has_many :books

  after_create :set_firebase

  def fb
    EmberManyEngine::Application.config.firebase
  end

  def fb_ref
    "authors/#{id}"
  end

  def fb_json

    books = []

    authors.each do | author |
      books.push(author.id)
    end

    {
      name: name
      book_ids: books
    }
  end

  def set_firebase
    fb.set(fb_ref, fb_json)
  end


end
