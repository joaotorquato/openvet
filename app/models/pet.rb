class Pet < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.jpg'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\Z}
  validates         :owner, :name, :species, :breed, :birth_date, :address,
                    :gender, :user_id, presence: true

  def set_user(user)
    self.user_id = user.id
    save
  end
end
