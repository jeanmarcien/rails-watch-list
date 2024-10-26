class List < ApplicationRecord
  GENRE_DETAILS = {
    "Comedy" => { description: "Light-hearted films that make you laugh.", image_url: "comedy_sss9qy" },
    "Drama" => { description: "Dramatic storytelling that explores complex characters.", image_url: "kefynmd9efqug2qqcg1i" },
    "Horror" => { description: "Scary films that aim to frighten the audience.", image_url: "horror_phplg0" },
    "Romance" => { description: "Love stories that capture the essence of romance.", image_url: "romance_rqlwxe" },
    "Documentary" => { description: "Non-fiction films that document reality.", image_url: "documentary_mjelvf" },
    "Superhero" => { description: "Exciting films featuring heroes with extraordinary powers and abilities.", image_url: "superhero_aq90wd" }
  }

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
end
