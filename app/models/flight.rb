class Flight < ApplicationRecord
  belongs_to :destination
  has_many :trips

  def self.direct(destination)
    where(destination: destination)
      .select { |f| f.stopover.blank? && f.stopover_return.blank? && f.company == f.company_return }
  end

  def self.direct_mix(destination)
    where(destination: destination)
      .select { |f| f.stopover.blank? && f.stopover_return.blank? && f.company != f.company_return }
  end

  def self.escale(destination)
    where(destination: destination)
      .select { |f| f.stopover.present? && f.stopover_return.present? }
  end

  def self.escale_aller(destination)
    where(destination: destination)
      .select { |f| f.stopover.present? && f.stopover_return.blank? }
  end

  def self.escale_retour(destination)
    where(destination: destination)
      .select { |f| f.stopover.blank? && f.stopover_return.present? }
  end
end
