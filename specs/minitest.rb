== SYNOPSIS:

Given that you'd like to test the following class:

  class Meme
    def i_can_has_cheezburger?
      "OHAI!"
    end

    def will_it_blend?
      "YES!"
    end
  end

=== Unit tests

  require 'minitest/autorun'

  class TestMeme < MiniTest::Unit::TestCase
    def setup
      @meme = Meme.new
    end

    def test_that_kitty_can_eat
      assert_equal "OHAI!", @meme.i_can_has_cheezburger?
    end

    def test_that_it_will_not_blend
      refute_match /^no/i, @meme.will_it_blend?
    end
  end

=== Specs

  require 'minitest/autorun'

  describe Meme do
    before do
      @meme = Meme.new
    end

    describe "when asked about cheeseburgers" do
      it "must respond positively" do
        @meme.i_can_has_cheezburger?.must_equal "OHAI!"
      end
    end

    describe "when asked about blending possibilities" do
      it "won't say no" do
        @meme.will_it_blend?.wont_match /^no/i
      end
    end
  end


  # Specs:                               # Equivalent Unit Tests:
  ###############################################################################
  describe Thingy do                     # class TestThingy < MiniTest::Unit::TestCase
    before do                            #   def setup
      do_some_setup                      #     super
    end                                  #     do_some_setup
                                         #   end
    it "should do the first thing" do    #
      1.must_equal 1                     #   def test_first_thing
    end                                  #     assert_equal 1, 1
                                         #   end
    describe SubThingy do                # end
      before do                          #
        do_more_setup                    # class TestSubThingy < TestThingy
      end                                #   def setup
                                         #     super
      it "should do the second thing" do #     do_more_setup
        2.must_equal 2                   #   end
      end                                #
    end                                  #   def test_second_thing
  end                                    #     assert_equal 2, 2
                                         #   end
                                         # end
  ###############################################################################
  # runs 2 specs                         # runs 3 tests
  ###############################################################################
  # The specs generate:

  class ThingySpec < MiniTest::Spec
    def setup
      super
      do_some_setup
    end

    def test_should_do_the_first_thing
      assert_equal 1, 1
    end
  end

  class SubThingySpec < ThingySpec
    def setup
      super
      do_more_setup
    end

    # because only setup/teardown is inherited, not specs
    remove_method :test_should_do_the_first_thing

    def test_should_do_the_second_thing
      assert_equal 2, 2
    end
  end