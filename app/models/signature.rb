class Signature < ActiveRecord::Base

  # State with most sigs
  def self.first_state
    "Cali"
  end

  # State with second-most sigs
  def self.second_state
    "Ny"
  end

  # State with third-most sigs
  def self.third_state
    "Mn"
  end
end
