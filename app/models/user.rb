class User < ActiveRecord::Base
  attr_accessible :street,:address, :company_info, :email, :name, :year_of_creation
  attr_writer :current_step
  after_initialize :set_beggining
  validates  :email, :name, presence: true, if: lambda { |o| o.current_step == "step1" }
  # validates :street,presence: true, if: lambda { |o| o.current_step == "step2" }
  validates :company_info, :presence => true, if: lambda { |o| o.current_step == "step3" }
  def year_of_creation
    created_at if created_at.present?
  end
  def year_of_creation=(year)
    year if year.present?
  end
  def street
    address[18] if address.present?
  end
  def street=(street)
    'Ukraine,Sevastopol,' + street if street.present?
  end
  def set_beggining
    @current_step = steps.first
  end
  def current_step
    @current_step || steps.first
  end

  def steps
    %w[step1 step2 step3 confirmation]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
