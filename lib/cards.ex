defmodule Cards do
  def create_deck do
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spades","Clubs","Hearts", "Diamonds"]

    for suit <- suits, value <- values do

        "#{suit} of #{value}"

    end


  end
  def shuffle(deck) do

    Enum.shuffle(deck)

  end
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def deal(deck, hand_size) do
    Enum.split(deck,hand_size)
  end
end
