class Flight < ApplicationRecord
  belongs_to :destination
  has_many :trips

  def self.direct(destination)
    where(destination: destination, company: "Air France", company_return: "Air France")
  end

  def self.direct_mix(destination)
    where(destination: destination, company: "Egyptair", company_return: "Air France")
  end

  def self.escale(destination)
    where(destination: destination, company: "Lufthansa")
  end

  def self.escale_aller(destination)
    where(destination: destination, company: "Swissair")
  end

  def self.escale_retour(destination)
    where(destination: destination, company_return: "Austrian")
  end
end
