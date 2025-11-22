class Space < ApplicationRecord
  attr_readonly :host
  
  MODES = {
    'public' => 'Public',
    'closed' => 'Closed',
    'private' => 'Private',
    'secret' => 'Secret'
  }
  
  has_many :feeds, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :profiles, dependent: :destroy

  validates_presence_of :host
  validates_presence_of :title  
  validates_inclusion_of :mode, :in => MODES.keys
end
