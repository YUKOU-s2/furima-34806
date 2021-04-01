class DeliveryTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１日〜２日で発想' },
    { id: 3, name: '3日〜４日で発想' },
    { id: 4, name: '４日〜７日で発想' },
  ]
    include ActiveHash::Associations
    has_many :items
  end