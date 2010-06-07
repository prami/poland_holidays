# -*- coding: utf-8 -*-
# PolandHolidays
Date.class_eval do

  def self.poland_holidays(year = Date.today.year)
    const = const_feasts(year)
    movable = self.movable_feasts(year)
    const.merge!(movable)
  end

  def self.const_feasts(year = Date.today.year)
    holidays={
      "Nowy Rok" => Date.new(year, 1, 1),
      "Święto Pracy" => Date.new(year, 5, 1),
      "Święto Narodowe Trzeciego Maja" => Date.new(year, 5, 3),
      "Wniebowzięcie Najświętszej Marii Panny" => Date.new(year, 8, 15),
      "Wszystkich Świętych" => Date.new(year, 11, 1),
      "Narodowe Święto Niepodległości" => Date.new(year, 11, 11),
      "Pierwszy Dzień Świąt Bożego Narodzenia" => Date.new(year, 12, 25),
      "Drugi Dzień Świąt Bożego Narodzenia" => Date.new(year, 12, 26)
    }
  end

  def self.movable_feasts(year = Date.today.year)
    a = year%19
    b, c = year/100, year%100
    d, e = b/4, b%4
    f = (b+8)/25
    g = (b-f+1)/3
    h = (19*a+b-d-g+15)%30
    i, k = c/4, c%4
    l = (32+2*e+2*i-h-k)%7
    m = (a+11*h+22*l)/451
    p, month = (h+l-7*m+114)%31, (h+l-7*m+114)/31
    day = p+1
    easter = Date.new(year, month, day)
    { "Wielkanoc" => easter, "Poniedziałek Wielkanocny" => easter+1, "Pierwszy dzień Zielonych Świątek" => easter+49, "Boże Ciało" => easter+60}
  end

end
