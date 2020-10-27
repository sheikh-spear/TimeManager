defmodule TimeManager.ClockPointerTest do
  use TimeManager.DataCase

  alias TimeManager.ClockPointer

  describe "clocks" do
    alias TimeManager.ClockPointer.Clock

    @valid_attrs %{start: ~N[2010-04-17 14:00:00], status: true}
    @update_attrs %{start: ~N[2011-05-18 15:01:01], status: false}
    @invalid_attrs %{start: nil, status: nil}

    def clock_fixture(attrs \\ %{}) do
      {:ok, clock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ClockPointer.create_clock()

      clock
    end

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert ClockPointer.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert ClockPointer.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do

      assert {:ok, %Clock{} = clock} = ClockPointer.create_clock(@valid_attrs)
      assert clock.start == ~N[2010-04-17 14:00:00]
      assert clock.status == true
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClockPointer.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{} = clock} = ClockPointer.update_clock(clock, @update_attrs)
      assert clock.start == ~N[2011-05-18 15:01:01]
      assert clock.status == false
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = ClockPointer.update_clock(clock, @invalid_attrs)
      assert clock == ClockPointer.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = ClockPointer.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> ClockPointer.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = ClockPointer.change_clock(clock)
    end
  end
end
