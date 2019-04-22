class Gossip
  attr_accessor :author, :content
  @@file = './db/gossip.csv'

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save

    CSV.open(@@file, "ab") do |csv|
      csv << [@author, @content]
    end
    #puts "gossip saved"
  end

  def self.all
    all_gossips = []

    CSV.read(@@file, "a+").each do |row|
    gossip_provisoire = Gossip.new(row[0], row[1])
    all_gossips << gossip_provisoire
    end
  return all_gossips

  def self.find(id)
    row = CSV.read(@@file)[id]
    Gossip.new(row[0], row[1])
    end

  end
end
