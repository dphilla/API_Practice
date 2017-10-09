class Member
  attr_reader :name,
              :role,
              :party,
              :district,
              :seniority

  def initialize(attributes = {})
    @name        = attributes[:name]
    @role        = attributes[:role]
    @party       = attributes[:party]
    @district    = attributes[:district]
    @seniority   = attributes[:seniority]
  end


  def self.find_all(state) #not a class method in the tutorial

    members = PropublicaService.find_house_members(state).map do |raw_member|
      Member.new(raw_member)
    end

  end


end
