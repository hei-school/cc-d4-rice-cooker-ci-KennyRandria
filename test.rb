# frozen_string_literal: true


class MockInputStream
    def gets
      "1\n"
    end
  end
  

  class MainTest
    def test_main
      assert_output(/Welcome to the Rice Cooker!/) { main }
    end
  
    def test_cook_rice
      assert_output(/Cooking rice...\nRice is cooked!/) { cook_rice }
    end
  
    def test_keep_warm
      assert_output(/Keeping warm activated.\nKeeping warm in progress.../) { keep_warm }
    end
  
    def test_automatic_shutdown
      assert_output(/Automatic shut-off after cooking.\nTurning off the rice cooker./) { automatic_shutdown }
    end
  
    def test_return_to_menu
      assert_output(/Press any key to return to the main menu.../) { return_to_menu }
    end
  end
  

  MainTest.new.test_main
  MainTest.new.test_cook_rice
  MainTest.new.test_keep_warm
  MainTest.new.test_automatic_shutdown
  MainTest.new.test_return_to_menu
  
