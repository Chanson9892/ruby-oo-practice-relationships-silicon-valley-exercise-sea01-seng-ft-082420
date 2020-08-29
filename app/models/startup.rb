require 'pry'
class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    #return **all** of the startup instances
    def self.all
        @@all
    end

    #change the domain and name of the startup.
    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    #returns the **first startup** whose founder's name matches
    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    #return an **array** of all of the different startup domains
    def self.domains
        self.all.map do |startup|
            startup.domain
        end

    end

    #creates a new funding round
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    #selects all the funding rounds that the
    #startup has gotten
    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    #Returns the total number of funding rounds that the
    #startup has gotten
    def num_funding_rounds
        self.funding_rounds.size
    end

    #Returns the total sum of investments that the startup has gotten
    def total_funds
        self.funding_rounds.map do |round|
            round.investment.sum
        end
    end

    #Returns a **unique** array of all the 
    #venture capitalists that have invested in this company
    def investors
        self.funding_rounds.map do |round|
            round.venture_capitalist.uniq 
        end
    end

    #Returns a **unique** array of all the venture capitalists 
    #that have invested in this company and are in the Trés Commas club
    def big_investors
        self.investors && VentureCapitalist.tres_commas_club
    end

end
#ruby tools/console.rb