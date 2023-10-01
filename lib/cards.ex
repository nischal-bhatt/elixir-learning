defmodule Cards do
  @moduledoc """
     Provides methods for creating and handling a deck of cards
  """

  @doc """
      Returns a list of strings
  """
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

  @doc """
    Determines if deck contains

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.contains?(deck,"Diamonds of Three")
      true
  """

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Spades of Ace"]

  """
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
