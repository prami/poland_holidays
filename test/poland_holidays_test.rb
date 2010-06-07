# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/test_helper.rb'
#require 'date'
class PolandHolidaysTest < Test::Unit::TestCase
  def test_movable_feasts_length
    assert_equal 4, Date.movable_feasts.length
  end

  def test_movable_feasts_in_2020
    assert_equal Date.new(2020, 4, 12), Date.movable_feasts(2020)["Wielkanoc"]
    assert_equal Date.new(2020, 4, 13), Date.movable_feasts(2020)["Poniedziałek Wielkanocny"]
    assert_equal Date.new(2020, 5, 31), Date.movable_feasts(2020)["Pierwszy dzień Zielonych Świątek"]
    assert_equal Date.new(2020, 6, 11), Date.movable_feasts(2020)["Boże Ciało"]
  end

  def test_const_feasts_length
    assert_equal 8, Date.const_feasts.length
  end

  def test_poland_holidays_length
    assert_equal 12, Date.poland_holidays.length
  end
end
