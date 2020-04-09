require "timecop"
require_relative "dater"

RSpec.describe Dater do
  let(:dater) { Dater.new }

  before do
    Timecop.freeze(Time.local(2020, 05, 06))
  end

  context "without arguments" do
    it "prints out today's date" do
      date = dater.date_for

      expect(date).to eq("2020-05-06")
    end
  end

  context "with a different format string" do
    it "prints out the date in the new format" do
      ENV["DATER_DATE_FORMAT"] = "%d-%m-%Y"

      date = dater.date_for

      expect(date).to eq("06-05-2020")

      ENV["DATER_DATE_FORMAT"] = nil
    end
  end

  context "yesterday" do
    %w(yday yesterday).each do |pattern|
      it "prints out yesterday's date given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-05")
      end
    end
  end

  context "tomorrow" do
    %w(tmr tomorrow).each do |pattern|
      it "prints out tomorrow's date given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-07")
      end
    end
  end

  context "monday" do
    %w(m mon monday).each do |pattern|
      it "prints out date for Monday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-04")
      end
    end
  end

  context "last-monday" do
    %w(last-m last-mon last-monday l-m l-mon l-monday).each do |pattern|
      it "prints out date for Monday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-04-27")
      end
    end
  end

  context "tuesday" do
    %w(t tue tuesday).each do |pattern|
      it "prints out date for Tuesday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-05")
      end
    end
  end

  context "last-tuesday" do
    %w(last-t last-tue last-tuesday l-t l-tue l-tuesday).each do |pattern|
      it "prints out date for Tuesday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-04-28")
      end
    end
  end

  context "wednesday" do
    before do
      Timecop.freeze(2020, 05, 07)
    end

    after do
      Timecop.return
    end

    %w(w wed wednesday).each do |pattern|
      it "prints out date for Wednesday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-06")
      end
    end
  end

  context "last-wednesday" do
    %w(last-w last-wed last-wednesday l-w l-wed l-wednesday).each do |pattern|
      it "prints out date for Wednesday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-04-29")
      end
    end
  end

  context "thursday" do
    %w(th thu thursday).each do |pattern|
      it "prints out date for Thursday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-07")
      end
    end
  end

  context "last-thursday" do
    %w(last-th last-thu last-thursday l-th l-thu l-thursday).each do |pattern|
      it "prints out date for Thursday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-04-30")
      end
    end
  end

  context "friday" do
    %w(f fri friday).each do |pattern|
      it "prints out date for Friday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-08")
      end
    end
  end

  context "last-friday" do
    %w(last-f last-fri last-friday l-f l-fri l-friday).each do |pattern|
      it "prints out date for Friday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-01")
      end
    end
  end

  context "saturday" do
    %w(s sat saturday).each do |pattern|
      it "prints out date for Saturday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-09")
      end
    end
  end

  context "last-saturday" do
    %w(last-s last-sat last-saturday l-s l-sat l-saturday).each do |pattern|
      it "prints out date for Saturday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-02")
      end
    end
  end

  context "sunday" do
    %w(su sun sunday).each do |pattern|
      it "prints out date for Sunday of this week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-10")
      end
    end
  end

  context "last-sunday" do
    %w(last-su last-sun last-sunday l-su l-sun l-sunday).each do |pattern|
      it "prints out date for Sunday of last week given #{pattern}" do
        date = dater.date_for(pattern)

        expect(date).to eq("2020-05-03")
      end
    end
  end

  context "a day" do
    it "prints date for this year and month" do
      date = dater.date_for("01")

      expect(date).to eq("2020-05-01")
    end

    it "prints date for this year and month given shorthand" do
      date = dater.date_for("1")

      expect(date).to eq("2020-05-01")
    end
  end

  context "a month and day" do
    it "prints out date for this year" do
      date = dater.date_for("01-01")

      expect(date).to eq("2020-01-01")
    end

    it "prints out date for this year given shorthand" do
      date = dater.date_for("1-1")

      expect(date).to eq("2020-01-01")
    end
  end

  context "a year a month and a day" do
    it "prints out the date" do
      date = dater.date_for("2020-01-01")

      expect(date).to eq("2020-01-01")
    end

    it "prints the date given a shorthand" do
      date = dater.date_for("20-1-1")

      expect(date).to eq("2020-01-01")
    end
  end
end
