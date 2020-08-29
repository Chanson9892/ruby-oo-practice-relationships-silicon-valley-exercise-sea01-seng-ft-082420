class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    #returns an array of all venture capitalists in the 
    #Trés Commas club ( more then 1,000,000,000 `total_worth`)
    def self.tres_commas_club
        self.all.select do |capitalist|
            capitalist.total_worth >= 1000000000
        end
    end

    #creates a new funding round
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    #returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    #Returns a **unique** list of all startups this venture capitalist has funded
    def portfolio
        self.funding_rounds.map do |round|
            round.startup.uniq 
        end
    end

    #returns the largest funding round given by this venture capitalist
    def biggest_investment
        self.funding_rounds.max_by do |round|
            round.startup.uniq 
        end
    end

    #returns the total amount invested in that domain
    def invested(domain)
        self.funding_rounds.select do |round|
            round.startup.domain == domain
        end
    end
end
