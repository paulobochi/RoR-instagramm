class Pic < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>" }

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
