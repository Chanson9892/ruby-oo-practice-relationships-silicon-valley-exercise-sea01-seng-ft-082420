class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f
        @@all << self

    end

    #returns an array of all venture capitalists
    def self.all
        @@all
    end

end
