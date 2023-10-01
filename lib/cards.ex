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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end

  end

  def loadAnother(fileName) do
    case File.read(fileName) do
      {:ok, binary } -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "No existing available"
    end
  end

  def create_hand(hand_size) do

    deck = Cards.create_deck
    deck = Cards.shuffle(deck)
    _hand = Cards.deal(deck, hand_size)


  end

  def create_hand_pipe(hand_size) do

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)

  end
end
