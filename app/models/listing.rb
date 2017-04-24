class Listing < ApplicationRecord

  validates :price, presence: true
  before_save :downcase_fields

  belongs_to :user

  has_many :pictures
  serialize :picture_json, JSON

  def self.by_city(city)
    return all unless city.present?
    where(:city => city)
  end

  def self.by_state(state)
    return all unless state.present?
    where(:state => state)
  end

  def self.by_bedrooms(rooms)
    return all unless rooms.present?
    where("bedrooms >= ?", rooms.to_i)
  end

  def self.by_pets(pets)
    return all unless pets.present?
    where(:pets => pets)
  end

  def self.by_bathroom(bathrooms)
    return all unless bathrooms.present?
    where("bathrooms >= ?", bathrooms.to_i)
  end

  def self.by_price(min_price, max_price)
    unless(max_price.present?)
      max_price = -1
    end

    unless (true if Float(max_price) rescue false)
      max_price = -1
    end

    unless(min_price.present?)
      min_price = 0
    end

    unless (true if Float(min_price) rescue false)
      min_price = 0
    end


    if (max_price.to_i > 0 && max_price.to_i < min_price.to_i)
      temp = min_price
      min_price = max_price
      max_price = temp
    end

    if(max_price.to_i <= 0)
        return where("price >= ?", min_price.to_i)
    else
        return where("price >= ? and price <= ?", min_price.to_i, max_price.to_i)
    end
  end

  def downcase_fields
    self.city.downcase! if self.city.present?
    self.state.downcase! if self.state.present?
    self.country.downcase! if self.country.present?
    self.pets.downcase! if self.pets.present?
    self.property_type.downcase! if self.property_type.present?
  end

  def as_json()
    super(:only => [:id, :price,:unit_num, :streetnum,:streetname,:city,:state, :country,:zipcode,:latitude,:longitude,:status,:property_desc,:property_type,:sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees],
          :include => {
              :pictures =>{:only => [:picture_json]}
          }
     )
  end
end
